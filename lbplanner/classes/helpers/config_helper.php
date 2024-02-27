<?php
// This file is part of the local_lbplanner.
//
// Moodle is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Moodle is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Moodle.  If not, see <http://www.gnu.org/licenses/>.

namespace local_lbplanner\helpers;

use core_component;
use core_customfield\category_controller;
use customfield_select\field_controller;
use local_modcustomfields\customfield\mod_handler;

/**
 * Helper class for config
 *
 * @package local_lbplanner
 * @subpackage helpers
 * @copyright 2024 NecodeIT
 * @license http://www.gnu.org/copyleft/gpl.html GNU GPL v3 or later
 */
class config_helper {
    public static function set_default_active_year() {
        $currentmonth = idate('m');
        if ($currentmonth >= 8 && $currentmonth <= 12) {
            // Adding the default active year, when the plugin is installed for the first time.
            set_config(
                'defaultactiveyear',
                substr(strval(idate('Y')), 2)
                . '/' .
                substr(strval(idate('Y') + 1), 2),
                'local_lbplanner'
            );
        } else {
            // Adding the default active year, when the plugin is installed for the first time.
            set_config(
                'defaultactiveyear',
                substr(strval(idate('Y') - 1), 2)
                . '/' .
                substr(strval(idate('Y')), 2),
                'local_lbplanner'
            );
        }
    }

    /**
     * Adds a customfield to moodle for each activity where teachers can select GK EK or both.
     *
     * Default value is GK.
     * Requires the following plugin 'modcustomfields'
     * @throws \coding_exception
     * @throws \moodle_exception
     * @throws \coding_exception
     */
    public static function add_customfield(): void {
        // Check if the category is already created and only create it if it doesn't exist.
        // Check if plugin "modcustomfields" is installed and create the category and the custom field.
        if (!get_config('local_lbplanner', 'categoryid')) {

            if (array_key_exists('modcustomfields', core_component::get_plugin_list('local'))) {

                $handler = mod_handler::create();
                $categoryid = $handler->create_category('LB Planner');

                set_config('categoryid', $categoryid, 'local_lbplanner');
                $categorycontroller = category_controller::create($categoryid, null, $handler);
                $categorycontroller->save();

                // Dont ask me why but moodle doesnt allow me to just insert the String "select" into the type field.
                $record = new \stdClass();
                $record->type = 'select';

                $fieldcontroller = field_controller::create(0, $record, $categorycontroller);
                // Added the default attributes for the custom field.
                $fieldcontroller->set('name', 'LB Planner GK/EK');
                $fieldcontroller->set('description', 'Tracks whether the task is a GK or EK task');
                $fieldcontroller->set('type', 'select');
                // Because moodle wants me to save the configdata as a json string, I have to do this.
                // I don't know why moodle does this, but it does. I don't like it. but I have to do it. so I do it.
                $fieldcontroller->set(
                    'configdata',
                    '{"required":"1","uniquevalues":"0","options":"GK\r\nEK\r\nGK and EK",
                "defaultvalue":"GK","locked":"0","visibility":"2"}'
                );
                $fieldcontroller->set('shortname', 'lb_planner_gk_ek');
                $fieldcontroller->save();
            }
        }
    }

    /**
     * Get the category id from the config
     * @return int the category id
     */
    public static function get_category_id(): int {
        if (!get_config('local_lbplanner', 'categoryid')) {
            return -1;
        } else {
            return intval(get_config('local_lbplanner', 'categoryid'));
        }
    }
}
