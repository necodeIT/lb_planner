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

/**
 * Provides helper methods for user related stuff.
 */
class user_helper {

    /**
     * Shortname of the admin role.
     */
    const ROLE_ADMIN = 'lbpa';

    /**
     * Shortname of the manager role.
     */
    const ROLE_MANAGER = 'lbpm';

    /**
     * Shortname of the teacher role.
     */
    const ROLE_TEACHER = 'lbpt';

    /**
     * Shortname of the student role.
     */
    const ROLE_STUDENT = 'lbps';

    /**
     * Maps role shortnames to their corresponding enum value.
     */
    const ROLE_ENUMS = [
        self::ROLE_ADMIN => 0,
        self::ROLE_MANAGER => 1,
        self::ROLE_TEACHER => 2,
        self::ROLE_STUDENT => 3
    ];

    /**
     * Name of the user database
     */
    const TABLE = 'local_lbplanner_users';

    /**
     * @deprecated Use user_helper::assert_access() instead
     * Checks if the current user has access to the given user id.
     *
     * @param int $userid The id of the user to check access for.
     * @return bool True if the current user has access to the given user id, false otherwise.
     */
    public static function check_access(int $userid):bool {
        global $USER;
        return $USER->id == $userid;
    }

    /**
     * Retrieves the user with the given id.
     * ```php
     * $mdluser->username // The username of the user.
     * $mdluser->firstname // The firstname of the user.
     * $mdluser->lastname // The lastname of the user.
     * $mdluser->profileimageurl // The profile image url of the user.
     * ```
     *
     * @param integer $userid The id of the user to retrieve.
     * @return stdClass The user with the given id.
     */
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

    /**
     * Checks if the current user has access to the given user id.
     * Throws an exception if the current user does not have access.
     *
     * @param int $userid The id of the user to check access for.
     * @return void
     */
    public static function assert_access(int $userid) {
        global $USER;
        ;
        if ($USER->id != $userid) {
            throw new \moodle_exception('Access denied');
        }
    }

    /**
     * Returns the role enum value for the given username.
     *
     * @param integer $userid The id of the user to retrieve the role for.
     * @return integer The enum value of the role.
     */
    public static function determin_user_role(int $userid) : int {
        global $DB;

        $adminid = $DB->get_field('role', 'id', array('shortname' => self::ROLE_ADMIN));
        $managerid = $DB->get_field('role', 'id', array('shortname' => self::ROLE_MANAGER));
        $teacherid = $DB->get_field('role', 'id', array('shortname' => self::ROLE_TEACHER));

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

    /**
     * Checks if the given user exists in the database.
     *
     * @param integer $userid The id of the user to check.
     * @return boolean True if the user exists, false otherwise.
     */
    public static function check_user_exists(int $userid): bool {
        global $DB;
        return $DB->record_exists(self::TABLE, array('userid' => $userid));
    }

    /**
     * Retrieves the user with the given id.
     * The returned object contains the following properties:
     * ```php
     * $user->id // The lbplanner id of the user.
     * $user->userid // The moodle id of the user.
     * $user->theme // The name of the theme the user has set for the app.
     * $user->language // The language the user has set for the app.
     * ```
     *
     * @param integer $userid The id of the user to retrieve.
     * @return stdClass The user with the given id.
     */
    public static function get_user(int $userid): stdClass {
        global $DB;
        return $DB->get_record(self::TABLE, array('userid' => $userid), '*', MUST_EXIST);
    }

    /**
     * Retrieves the full name of the user with the given id.
     *
     * @param integer $userid The id of the user to retrieve the full name for.
     * @return string The full name of the user with the given id.
     */
    public static function get_complete_name(int $userid): string {
        $user = self::get_mdl_user_info($userid);

        return $user->firstname . ' ' . $user->lastname;
    }

}
