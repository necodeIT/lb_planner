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

namespace local_lbplanner_services;

use external_api;
use external_function_parameters;
use external_value;
use local_lbplanner\helpers\modules_helper;
use local_lbplanner\helpers\plan_helper;
use local_lbplanner\helpers\user_helper;

/**
 * Get the data for a module.
 */
class modules_get_module extends external_api {
    public static function get_module_parameters() {
        return new external_function_parameters(array(
            'moduleid' => new external_value(PARAM_INT, 'The id of the module', VALUE_REQUIRED, null, NULL_NOT_ALLOWED),
            'userid' => new external_value(PARAM_INT, 'The id of the user', VALUE_REQUIRED, null, NULL_NOT_ALLOWED),
        ));
    }

    public static function get_module($moduleid, $userid) {
        global $DB;

        self::validate_parameters(self::get_module_parameters(), array('moduleid' => $moduleid, 'userid' => $userid));

        user_helper::assert_access($userid);

        if (!$DB->record_exists(modules_helper::ASSIGN_TABLE, array('id' => $moduleid))) {
            throw new \moodle_exception('Module not found');
        }

        return modules_helper::get_module($moduleid, $userid);
    }

    public static function get_module_returns() {
        return modules_helper::structure();
    }
}
