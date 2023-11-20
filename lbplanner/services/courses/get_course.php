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

use dml_exception;
use external_api;
use external_function_parameters;
use external_single_structure;
use external_value;
use invalid_parameter_exception;
use local_lbplanner\helpers\course_helper;
use moodle_exception;

/**
 * Get the data for a course.
 * Retrieves the data for a specific course.
 * @package local_lbplanner_services
 * @copyright 2023 NecodeIT
 * @license http://www.gnu.org/copyleft/gpl.html GNU GPL v3 or later
 */
class courses_get_course extends external_api {
    public static function get_course_parameters() {
        return new external_function_parameters([
            'courseid' => new external_value(PARAM_INT, 'The id of the course', VALUE_REQUIRED, null, NULL_NOT_ALLOWED)
        ]);
    }

    /**
     * @throws dml_exception
     * @throws moodle_exception
     * @throws invalid_parameter_exception
     */
    public static function get_course($courseid) {
        global $DB, $USER;
        // TODO: Fetch all courses first.
        $userid = $USER->id;

        self::validate_parameters(self::get_course_parameters(), ['courseid' => $courseid]);
        if (!course_helper::check_access($courseid, $userid)) {
            throw new moodle_exception('Not Enrolled in course');
        }

        if (!$DB->record_exists(course_helper::LBPLANNER_COURSE_TABLE, ['courseid' => $courseid, 'userid' => $userid])) {
            throw new moodle_exception('You have to fetch all courses First');
        }
        $course = $DB->get_record(
            course_helper::LBPLANNER_COURSE_TABLE,
            ['courseid' => $courseid, 'userid' => $userid],
            '*',
            MUST_EXIST
        );
        $course->name = course_helper::get_fullname($course->courseid);
        unset($course->userid);
        unset($course->id);
        return $course;
    }

    public static function get_course_returns() {
        return new external_single_structure(
            [
                'courseid' => new external_value(PARAM_INT, 'The id of the course'),
                'color' => new external_value(PARAM_TEXT, 'The color of the course'),
                'name' => new external_value(PARAM_TEXT, 'The name of the course'),
                'shortname' => new external_value(PARAM_TEXT, 'The shortname of the course'),
                'enabled' => new external_value(PARAM_BOOL, 'Whether the course is enabled or not'),
            ]
        );
    }
}
