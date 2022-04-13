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
use external_multiple_structure;
use external_value;
use local_lbplanner\helpers\modules_helper;
use local_lbplanner\helpers\user_helper;
use local_lbplanner_services\modules_get_module;

/**
 * Get all the modules of the given course.
 */
class modules_get_all_course_modules extends external_api {
    public static function get_all_course_modules_parameters() {
        return new external_function_parameters(array(
            'courseid' => new external_value(PARAM_INT, 'The id of the course', VALUE_REQUIRED, null, NULL_NOT_ALLOWED),
            'userid' => new external_value(PARAM_INT, 'The id of the user', VALUE_REQUIRED, null, NULL_NOT_ALLOWED),
        ));
    }

    public static function get_all_course_modules($courseid, $userid) {
        global $DB;

        self::validate_parameters(
            self::get_all_course_modules_parameters(),
            array('courseid' => $courseid, 'userid' => $userid)
        );

        user_helper::assert_access($userid);

        $mdlmodules = $DB->get_records(modules_helper::ASSIGN_TABLE, array('course' => $courseid));

        $modules = array();

        foreach ($mdlmodules as $mdlmodule) {
            $modules[] = modules_get_module::get_module($mdlmodule->id, $userid);
        }

        return $modules;
    }

    public static function get_all_course_modules_returns() {
        return new external_multiple_structure(
            modules_helper::structure(),
        );
    }
}
