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

use core_reportbuilder\local\filters\text;
use moodle_url;
use stdClass;

define('LB_PLANNER_ADMIN', 'lbpa');
define('LB_PLANNER_MANAGER', 'lbpm');
define('LB_PLANNER_TEACHER', 'lbpt');
define('LB_PLANNER_STUDENT', 'lbps');

define(
    'LB_PLANNER_ROLE_ENUMS' ,
    [
        LB_PLANNER_ADMIN => 0,
        LB_PLANNER_MANAGER => 1,
        LB_PLANNER_TEACHER => 2,
        LB_PLANNER_STUDENT => 3
    ]
);

class user_helper {

    public static function table():string {
        return 'local_lbplanner_users';
    }

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
        $adminid = $DB->get_field('role', 'id', array('shortname' => LB_PLANNER_ADMIN));
        $managerid = $DB->get_field('role', 'id', array('shortname' => LB_PLANNER_MANAGER));
        $teacherid = $DB->get_field('role', 'id', array('shortname' => LB_PLANNER_TEACHER));
        $studentid = $DB->get_field('role', 'id', array('shortname' => LB_PLANNER_STUDENT));

        $isadmin = $DB->record_exists('role_assignments', array('userid' => $userid, 'roleid' => $adminid));
        $ismanager = $DB->record_exists('role_assignments', array('userid' => $userid, 'roleid' => $managerid));
        $isteacher = $DB->record_exists('role_assignments', array('userid' => $userid, 'roleid' => $teacherid));

        if ($isadmin) {
            return LB_PLANNER_ROLE_ENUMS[LB_PLANNER_ADMIN];
        } else if ($ismanager) {
            return LB_PLANNER_ROLE_ENUMS[LB_PLANNER_MANAGER];
        } else if ($isteacher) {
            return LB_PLANNER_ROLE_ENUMS[LB_PLANNER_TEACHER];
        } else {
            return LB_PLANNER_ROLE_ENUMS[LB_PLANNER_STUDENT];
        }
    }

    public static function check_user_exists(int $userid): bool {
        global $DB;
        return $DB->record_exists('local_lbplanner_users', array('userid' => $userid));
    }

    public static function get_user(int $userid): stdClass {
        global $DB;
        return $DB->get_record(self::table(), array('userid' => $userid), '*', MUST_EXIST);
    }

}
