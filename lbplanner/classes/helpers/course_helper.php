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


class course_helper{

    /**
    *  Name of the Enrol Table 
    */
    const ENROL_TABLE = 'mdl_enrol';

    /**
     * Name of the User Enroll Table
     */
    const USER_ENROL_TABLE = 'mdl_user_enrolments';

    /**
     * Name of the Course Table
     */
    const COURSE_TABLE = 'mdl_course';

    const CATEGORY_TABLE = 'mdl_course_categories';
    

    public static function get_enrollments(int $userid){
        global $DB;
        return $DB->get_fieldset_sql('SELECT enrolid FROM ' . self::USER_ENROL_TABLE . ' WHERE userid= ' . $userid);
    }
    
    public static function get_current_year(){
        return strval(intval(date('Y'))+1);
    }
    
    public static function get_current_category(){
        global $DB;
        // check if category year contains the categogry name
        return $DB->get_record_sql('SELECT id FROM ' . self::CATEGORY_TABLE . ' WHERE name LIKE "' . self::get_current_year() . '%"');
    }


    
}