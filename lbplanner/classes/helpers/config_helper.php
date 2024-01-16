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

use core_customfield\category_controller;
use customfield_select\data_controller;
use customfield_select\field_controller;
use local_modcustomfields\customfield\mod_handler as mod_handler;
class   config_helper {
    public static function set_default_active_year() {
        $currentmonth = idate('m');
        if ($currentmonth >= 8 && $currentmonth <= 12) {
            // Adding the default active year, when the plugin is installed for the first time.
            set_config(
                'defaultactiveyear',
                substr(strval(idate('Y')), 2)
                .'/'.
                substr(strval(idate('Y') + 1), 2),
                'local_lbplanner'
            );
        } else {
            // Adding the default active year, when the plugin is installed for the first time.
            set_config(
                'defaultactiveyear',
                substr(strval(idate('Y') - 1), 2)
                .'/'.
                substr(strval(idate('Y')), 2),
                'local_lbplanner'
            );
        }
    }

    /**
     * @throws \moodle_exception
     * @throws \coding_exception
     */
    public static function add_customfield() {
        if (in_array('modcustomfields', get_list_of_plugins('local'))) {
            $handler = mod_handler::create();
            $categoryid = $handler->create_category('lb-planner');
            $categorycontroller = category_controller::create($categoryid, null, $handler);
            $categorycontroller->save();
            $record = new \stdClass();
            $record->type = 'select';
            $fieldcontroller = field_controller::create(0, $record, $categorycontroller);
            $fieldcontroller->set('name', 'gk');
            $fieldcontroller->set('description', 'GK');
            $fieldcontroller->set('type', 'select');
            $fieldcontroller->set('configdata', json_encode(['options' => ['GK', 'EK']]));
            $fieldcontroller->set('shortname', 'lb_planner_gk_ek');
            $fieldcontroller->save();
        }
    }
}
