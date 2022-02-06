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

use moodle_url;
use stdClass;

class user_helper {

    const ROLE_ADMIN = 'lbpa';
    const ROLE_MANAGER = 'lbpm';
    const ROLE_TEACHER = 'lbpt';
    const ROLE_STUDENT = 'lbps';

    const ROLE_ENUMS = [
        self::ROLE_ADMIN => 0,
        self::ROLE_MANAGER => 1,
        self::ROLE_TEACHER => 2,
        self::ROLE_STUDENT => 3
    ];

    const TABLE = 'local_lbplanner_users';


    public static function check_access(int $userid):bool {
        global $USER;
        return $USER->id == $userid;
    }

    public static function get_mdl_user_info(int $userid):stdClass {
        global $DB;
        $user = $DB->get_record('user', array('id' => $userid), '*', MUST_EXIST);

        $mdluser = new stdClass();
        $mdluser->username = $user->username;
        $mdluser->firstname = $user->firstname;
        $mdluser->lastname = $user->lastname;
        $mdluser->profileimageurl = strval(new moodle_url('/user/pix.php/'.$user->id.'/f1.jpg'));

        return $mdluser;
    }

    public static function determin_user_role(int $userid) : int {
        global $DB;

        $mdluser = $DB->get_record('user', array('id' => $userid), '*', MUST_EXIST);
        $adminid = $DB->get_field('role', 'id', array('shortname' => self::ROLE_ADMIN));
        $managerid = $DB->get_field('role', 'id', array('shortname' => self::ROLE_MANAGER));
        $teacherid = $DB->get_field('role', 'id', array('shortname' => self::ROLE_TEACHER));
        $studentid = $DB->get_field('role', 'id', array('shortname' => self::ROLE_STUDENT));

        $isadmin = $DB->record_exists('role_assignments', array('userid' => $userid, 'roleid' => $adminid));
        $ismanager = $DB->record_exists('role_assignments', array('userid' => $userid, 'roleid' => $managerid));
        $isteacher = $DB->record_exists('role_assignments', array('userid' => $userid, 'roleid' => $teacherid));

        if ($isadmin) {
            return self::ROLE_ENUMS[self::ROLE_ADMIN];
        } else if ($ismanager) {
            return self::ROLE_ENUMS[self::ROLE_MANAGER];
        } else if ($isteacher) {
            return self::ROLE_ENUMS[self::ROLE_TEACHER];
        } else {
            return self::ROLE_ENUMS[self::ROLE_STUDENT];
        }
    }

    public static function check_user_exists(int $userid): bool {
        global $DB;
        return $DB->record_exists('local_lbplanner_users', array('userid' => $userid));
    }

    public static function get_user(int $userid): stdClass {
        global $DB;
        return $DB->get_record(self::TABLE, array('userid' => $userid), '*', MUST_EXIST);
    }

}
