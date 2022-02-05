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
use external_single_structure;
use external_value;

class courses_get_all_courses extends external_api {
    public static function get_all_courses_parameters() {
        return new external_function_parameters(array(
            'userid' => new external_value(PARAM_INT, 'The id of the user to get the courses for'),
        ));
    }

    public static function get_all_courses($userid) {
        global $DB;
        global $USER;

        $params = self::validate_parameters(self::get_all_courses_parameters(), array('userid' => $userid));

        // TODO: Check if the user is allowed to get the data for this userid.
        // TODO: Get all courses of the current year.

        return array();
    }

    public static function get_all_courses_returns() {
        return new external_multiple_structure(
            new external_single_structure(
                array(
                    'courseid' => new external_value(PARAM_INT, 'The id of the course'),
                    'color' => new external_value(PARAM_TEXT, 'The color of the course'),
                    'name' => new external_value(PARAM_TEXT, 'The name of the course'),
                    'shortname' => new external_value(PARAM_TEXT, 'The shortname of the course'),
                    'enabled' => new external_value(PARAM_BOOL, 'Whether the course is enabled or not'),
                    'userid' => new external_value(PARAM_INT, 'The id of the user'),
                )
            )
        );
    }
}
