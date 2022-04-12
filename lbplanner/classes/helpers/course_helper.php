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

    const COLORS = array('#F50057', '#536DFE', '#F9A826', '#00BFA6', '#9B59B6', '#37BBCA', '#E67E22');

    const DISABLED_COURSE = 0;
    const ENABLED_COURSE = 1;

    /**
     * Get all the courses of the user
     * @param int userid
     *
     * @return array
     */
    public static function get_enrollments(int $userid) : array {
        global $DB;
        return $DB->get_fieldset_sql('SELECT enrolid FROM ' . self::USER_ENROL_TABLE . ' WHERE userid= ' . $userid);
    }

    /**
     * Get the current year
     *
     * @return string the current year the last 2 digits (20(20))
     */
    public static function get_current_year() : string {
        return substr(date('Y'), 2);
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
     * @param int $courseid
     * @return stdClass course
     */
    public static function get_mdl_course($courseid) : stdClass {
        global $DB;
        return $DB->get_record(self::COURSE_TABLE, array('id' => $courseid));
    }
    /**
     * Get course from lbpanner DB
     *
     * @param int $courseid
     * @return stdClass course
     */
    public static function get_lbplanner_course($courseid) : stdClass {
        global $DB;
        return $DB->get_record(self::LBPLANNER_COURSE_TABLE, array('courseid' => $courseid));
    }

    /**
     * Check if the user is enrolled in the course
     *
     * @param int $courseid
     * @param int $userid
     * @return bool true if the user is enrolled
     */
    public static function check_access($courseid, $userid) : bool {
        global $DB;
        $enrolmentid = $DB->get_field(self::ENROL_TABLE, 'id', array('courseid' => $courseid));
        if ($DB->record_exists(self::USER_ENROL_TABLE, array('enrolid' => $enrolmentid, 'userid' => $userid))) {
            return true;
        }
        return false;
    }
}
