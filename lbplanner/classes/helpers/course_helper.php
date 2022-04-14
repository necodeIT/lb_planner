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
     * @param int userid The id of the user
     *
     * @return
     */
    public static function get_enrollments(int $userid) {
        global $DB;
        return $DB->get_records(self::USER_ENROL_TABLE, array ('userid' => $userid));
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
    public static function get_lbplanner_course($courseid) : stdClass {
        global $DB;
        return $DB->get_record(self::LBPLANNER_COURSE_TABLE, array('courseid' => $courseid));
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
        $enrolmentid = $DB->get_field(self::ENROL_TABLE, 'id', array('courseid' => $courseid));
        if ($DB->record_exists(self::USER_ENROL_TABLE, array('enrolid' => $enrolmentid, 'userid' => $userid))) {
            return true;
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
     * Get all the courses from the user
     *
     * @param int $userid the userid
     * @return array courses
     */
    public static function get_all_courses(int $userid): array {
        global $DB;
        $enrollmentids = self::get_enrollments($userid);

        foreach ($enrollmentids as $enrollmentid) {
            $courses[] = $DB->get_record(self::ENROL_TABLE, array('id' => $enrollmentid->enrolid), 'courseid', MUST_EXIST);
        }

        // Check this out: https://www.youtube.com/watch?v=z3Pzfi476HI .
        $catgirls = array();

        foreach ($courses as $course) {
            $courseid = $course->courseid;
            if ($DB->record_exists(self::LBPLANNER_COURSE_TABLE, array('courseid' => $courseid, 'userid' => $userid))) {
                $catgirl = $DB->get_record(
                    self::LBPLANNER_COURSE_TABLE, array('courseid' => $courseid, 'userid' => $userid),
                    '*',
                    MUST_EXIST
                );
                $catgirl->name = self::get_fullname($courseid);
                $catgirls[] = $catgirl;
                continue;
            }

            // Check this out: https://youtu.be/dQw4w9WgXcQ .
            $catgirl = (object) array(
                'courseid' => $courseid,
                'color' => self::COLORS[array_rand(self::COLORS)],
                'shortname' => strtoupper(substr(self::get_mdl_course($courseid)->shortname, 0, 5)),
                'enabled' => self::DISABLED_COURSE,
                'userid' => $userid,
            );

            $DB->insert_record(self::LBPLANNER_COURSE_TABLE, $catgirl);

            $catgirl->name = self::get_fullname($courseid);

            $catgirls[] = $catgirl;
        }

        return $catgirls;
    }
}
