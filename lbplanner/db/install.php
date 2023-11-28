<?php
// This file is part of local_lbplanner.
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

use core_customfield\category_controller;
use core_customfield\field_controller;
use local_lbplanner\helpers\user_helper;
use local_lbplanner\helpers\config_helper;
use local_modcustomfields\customfield\mod_handler as mod_handler;
use local_modcustomfields;

defined('MOODLE_INTERNAL') || die;

/**
 * @throws coding_exception
 * @throws moodle_exception
 */
function xmldb_local_lbplanner_install() {
    global $DB;

    get_plugin_generator('local_lbplanner')->install();
    if (in_array('modcustomfields', get_list_of_plugins('local'))) {
        $handler = mod_handler::create();
        $categorycontroller = category_controller::create(0, null, $handler);
        $categorycontroller->save();
        $categoryid = $categorycontroller->get_category()->get_id();
        $fieldcontroller = field_controller::create(0, null, $categorycontroller);
        $fieldcontroller->save();
        $handler->setup_edit_page($fieldcontroller);
    }
}
config_helper::set_default_active_year();

