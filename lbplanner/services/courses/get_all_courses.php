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
use local_lbplanner\helpers\user_helper;
use local_lbplanner\helpers\course_helper;

/**
 * Get all the courses of the current year.
 */
class courses_get_all_courses extends external_api {
    public static function get_all_courses_parameters() {
        return new external_function_parameters(array(
            'userid' => new external_value(
                PARAM_INT,
                'The id of the user to get the courses for',
                VALUE_REQUIRED,
                null,
                NULL_NOT_ALLOWED
            ),
        ));
    }

    public static function get_all_courses($userid) {
        global $DB;

        self::validate_parameters(self::get_all_courses_parameters(), array('userid' => $userid));

        user_helper::assert_access($userid);

        global $DB;
        $enrollmentids = course_helper::get_enrollments($userid);

        foreach ($enrollmentids as $enrollmentid) {
            $courses[] = $DB->get_record(course_helper::ENROL_TABLE, array('id' => $enrollmentid->enrolid), 'courseid', MUST_EXIST);
        }

        // Check this out: https://www.youtube.com/watch?v=z3Pzfi476HI .
        $catgirls = array();

        foreach ($courses as $course) {
            $courseid = $course->courseid;
            if ($DB->record_exists(course_helper::LBPLANNER_COURSE_TABLE, array('courseid' => $courseid, 'userid' => $userid))) {
                $catgirl = $DB->get_record(
                    course_helper::LBPLANNER_COURSE_TABLE, array('courseid' => $courseid, 'userid' => $userid),
                    '*',
                    MUST_EXIST
                );
                $catgirl->name = course_helper::get_fullname($courseid);
                $catgirls[] = $catgirl;
                continue;
            }
            $shortname = substr(course_helper::get_mdl_course($courseid)->shortname, 0, 5);
            if (strpos($shortname, ' ') !== false) {
                $shortname = substr($shortname, 0, strpos($shortname, ' '));
            }
            // Check this out: https://youtu.be/dQw4w9WgXcQ .
            $catgirl = (object) array(
                'courseid' => $courseid,
                'color' => course_helper::COLORS[array_rand(course_helper::COLORS)],
                'shortname' => strtoupper($shortname),
                'enabled' => course_helper::DISABLED_COURSE,
                'userid' => $userid,
            );

            $DB->insert_record(course_helper::LBPLANNER_COURSE_TABLE, $catgirl);

            $catgirl->name = course_helper::get_fullname($courseid);

            $catgirls[] = $catgirl;
        }
        return $catgirls;
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
