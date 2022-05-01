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
use local_lbplanner\helpers\user_helper;
use local_lbplanner\helpers\course_helper;

/**
 * Get the data for a course.
 */
class courses_get_course extends external_api {
    public static function get_course_parameters() {
        return new external_function_parameters(array(
            'courseid' => new external_value(PARAM_INT, 'The id of the course', VALUE_REQUIRED, null, NULL_NOT_ALLOWED),
            'userid' => new external_value(PARAM_INT, 'The id of the user', VALUE_REQUIRED, null, NULL_NOT_ALLOWED),
        ));
    }

    public static function get_course($courseid, $userid) {
        global $DB;

        self::validate_parameters(self::get_course_parameters(), array('courseid' => $courseid, 'userid' => $userid));

        if (!$DB->record_exists('course', array('id' => $courseid))) {
            throw new \moodle_exception('Course not found');
        }

        user_helper::assert_access($userid);

        if (!course_helper::check_access($courseid, $userid)) {
            throw new \moodle_exception('Not Enrolled in course');
        }

        $course = $DB->get_record(
            course_helper::LBPLANNER_COURSE_TABLE,
            array('courseid' => $courseid, 'userid' => $userid),
            '*',
            MUST_EXIST
        );
        $course->name = course_helper::get_fullname($course->courseid);
        return $course;
    }

    public static function get_course_returns() {
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
