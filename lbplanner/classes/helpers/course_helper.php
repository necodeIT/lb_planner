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

use stdClass;

class course_helper {



    /**
     *  Name of the Enrol Table
     */
    const ENROL_TABLE = 'enrol';

    /**
     * Name of the User Enroll Table
     */
    const USER_ENROL_TABLE = 'user_enrolments';

    /**
     * Name of the Course Table
     */
    const COURSE_TABLE = 'course';

    /**
     * Name of the Category Table
     */
    const CATEGORY_TABLE = 'course_categories';

    const LBPLANNER_COURSE_TABLE = 'local_lbplanner_courses';

    const COLORS = array(
        "#f50057",
        "#536dfe",
        "#f9a826",
        "#00bfa6",
        "#9b59b6",
        "#37bbca",
        "#e67e22",
        "#37CA48",
        "#CA3737",
        "#B5CA37",
        "#37CA9E",
        "#3792CA",
        "#376ECA",
        "#8B37CA",
        "#CA37B9",
    );

    const DISABLED_COURSE = 0;
    const ENABLED_COURSE = 1;

    /**
     * Get all the courses of the user
     * @param int userid The id of the user
     *
     * @return array of EnrollIds
     */
    public static function get_enrollments(int $userid) {
        global $DB;
        $enrollments = array();
        $records = $DB->get_records(self::USER_ENROL_TABLE, array ('userid' => $userid));
        foreach ($records as $record) {
            if (in_array($record->enrolid, $enrollments) === false) {
                $enrollments[] = $record->enrolid;
            }
        }
        return $enrollments;
    }

    /**
     * Get the current year
     *
     * @return string the current year the last 2 digits (20(20))
     */
    public static function get_current_year() : string {
        if (strpos(get_config('local_lbplanner', 'activeyear'), '/' ) !== false) {
            return get_config('local_lbplanner', 'activeyear');
        }
        return get_config('local_lbplanner', 'defaultactiveyear');
    }

    /**
     * Get the current category id
     *
     * @return int id of the current category
     */
    public static function get_current_category() : int {
        global $DB;

        return $DB->get_record_sql(
            'SELECT id FROM ' . self::CATEGORY_TABLE . ' WHERE name LIKE "%' . self::get_current_year() . '%"'
        );
    }
    /**
     * Get course from mdl DB
     *
     * @param int $courseid id of the course
     * @return stdClass course from moodle
     */
    public static function get_mdl_course($courseid) : stdClass {
        global $DB;
        return $DB->get_record(self::COURSE_TABLE, array('id' => $courseid));
    }
    /**
     * Get course from lbpanner DB
     *
     * @param int $courseid id of the course in lbplanner
     * @return stdClass course from lbplanner
     */
    public static function get_lbplanner_course($courseid, $userid) : stdClass {
        global $DB;
        return $DB->get_record(self::LBPLANNER_COURSE_TABLE, array('courseid' => $courseid, 'userid' => $userid));
    }

    /**
     * Check if the user is enrolled in the course
     *
     * @param int $courseid course id
     * @param int $userid user id
     * @return bool true if the user is enrolled
     */
    public static function check_access($courseid, $userid) : bool {
        global $DB;
        $enrolmentids = $DB->get_records(self::ENROL_TABLE, array('courseid' => $courseid), '', '*');
        foreach ($enrolmentids as $enrolmentid) {
            if ($DB->record_exists(self::USER_ENROL_TABLE, array('enrolid' => $enrolmentid->id, 'userid' => $userid))) {
                return true;
            }
        }
        return false;
    }
    /**
     * gets the fullname from a course
     *
     * @param int $courseid the course id
     * @return string the fullname of the course
     */
    public static function get_fullname($courseid) {
        global $DB;
        return $DB->get_record(self::COURSE_TABLE, array('id' => $courseid), '*', MUST_EXIST)->fullname;
    }
    /**
     * Check if the course is from the current year
     *
     * @param int $courseid the course id
     * @return bool true if the course is from the current year
     */
    public static function check_current_year($courseid) {
        if (strpos(self::get_fullname($courseid), self::get_current_year()) !== false) {
            return true;
        } else {
            return false;
        }
    }
    public static function get_courseid($enrolmentid) {
        global $DB;
        return $DB->get_record(self::ENROL_TABLE, array('id' => $enrolmentid), '*', MUST_EXIST)->courseid;
    }
}
