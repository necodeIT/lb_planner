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
use external_single_structure;
use external_value;

/**
 * Update the data for a course.
 */
class course_update_course extends external_api {
    public static function update_course_parameters() {
        return new external_function_parameters(array(
            'courseid' => new external_value(PARAM_INT, 'The id of the course', VALUE_REQUIRED, null, NULL_NOT_ALLOWED),
            'color' => new external_value(PARAM_TEXT, 'The color of the course', VALUE_REQUIRED, null, NULL_NOT_ALLOWED),
            'name' => new external_value(PARAM_TEXT, 'The name of the course', VALUE_REQUIRED, null, NULL_NOT_ALLOWED),
            'shortname' => new external_value(PARAM_TEXT, 'The shortname of the course', VALUE_REQUIRED, null, NULL_NOT_ALLOWED),
            'enabled' => new external_value(
                PARAM_BOOL,
                'Whether the course is enabled or not',
                VALUE_REQUIRED,
                null,
                NULL_NOT_ALLOWED
            ),
            'userid' => new external_value(PARAM_INT, 'The id of the user', VALUE_REQUIRED, null, NULL_NOT_ALLOWED),
        ));
    }

    public static function update_course($courseid, $color, $name, $shortname, $enabled, $userid) {
        global $DB;
        global $USER;

        $params = self::validate_parameters(
            self::update_course_parameters(),
            array(
                'courseid' => $courseid,
                'color' => $color,
                'name' => $name,
                'shortname' => $shortname,
                'enabled' => $enabled,
                'userid' => $userid
            )
        );

        return array();
    }

    public static function update_course_returns() {
        return new external_single_structure(
            array(
                'courseid' => new external_value(PARAM_INT, 'The id of the course'),
                'color' => new external_value(PARAM_TEXT, 'The color of the course'),
                'name' => new external_value(PARAM_TEXT, 'The name of the course'),
                'shortname' => new external_value(PARAM_TEXT, 'The shortname of the course'),
                'enabled' => new external_value(PARAM_BOOL, 'Whether the course is enabled or not'),
                'userid' => new external_value(PARAM_INT, 'The id of the user'),
            )
        );
    }
}
