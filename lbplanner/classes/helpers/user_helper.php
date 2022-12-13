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

use context_system;
use moodle1_converter;
use moodle_database;
use moodle_url;
use moodleform;
use stdClass;

/**
 * Provides helper methods for user related stuff.
 */
class user_helper {

    /**
     * Shortname of the admin CAPABILITY.
     */
    const CAPABILITY_ADMIN = 'local/lb_planner:admin';

    /**
     * Shortname of the manager CAPABILITY.
     */
    const CAPABILITY_MANAGER = 'local/lb_planner:manager';

    /**
     * Shortname of the teacher CAPABILITY.
     */
    const CAPABILITY_TEACHER = 'local/lb_planner:teacher';

    /**
     * Shortname of the student CAPABILITY.
     */
    const CAPABILITY_STUDENT = 'local/lb_planner:student';

    /**
     * Maps CAPABILITY shortnames to their corresponding enum value.
     */
    const CAPABILITY_ENUMS = [
        self::CAPABILITY_ADMIN => 1,
        self::CAPABILITY_MANAGER => 2,
        self::CAPABILITY_TEACHER => 4,
        self::CAPABILITY_STUDENT => 8
    ];

    /**
     * Name of the user database
     */
    const TABLE = 'local_lbplanner_users';

    /**
     * The table where moodle stores the user data.
     */
    const MOODLE_TABLE = 'user';

    /**
     * The table where moodle stores the user context data.
     */
    const MOODLE_CONTEXT_TABLE = 'context';

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
        $user = $DB->get_record(self::MOODLE_TABLE, array('id' => $userid), '*', MUST_EXIST);
        $contextid = $DB->get_record(
            self::MOODLE_CONTEXT_TABLE,
            array('depth' => 2, 'contextlevel' => 30, 'instanceid' => $userid),
            '*',
            IGNORE_MISSING
        );
        $mdluser = new stdClass();
        $mdluser->username = $user->username;
        $mdluser->firstname = $user->firstname;
        $mdluser->lastname = $user->lastname;
        $mdluser->profileimageurl = strval(moodle_url::make_pluginfile_url($contextid->id, 'user', 'icon', null, '/boost_union/', 'f1.png'));
        $mdluser->vintage = $user->address;

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
        if ($USER->id != $userid) {
            throw new \moodle_exception('Access denied');
        }
    }

    /**
     * Gives back a bitmask which represents the capabilities of the given user.
     * 0 = no capabilities
     * 1 = admin
     * 2 = manager
     * 3 = admin + manager
     * 4 = teacher
     * 5 = admin + teacher
     * 6 = manager + teacher
     * 7 = admin + manager + teacher
     * 8 = student
     * 9 = admin + student
     * 10 = manager + student
     * 11 = admin + manager + student
     * 12 = teacher + student
     * 13 = admin + teacher + student
     * 14 = manager + teacher + student
     * 15 = admin + manager + teacher + student
     *
     *
     * @param int $userid The id of the user to check access for.
     * @return int The capabilities of the given user.
     */
    public static function get_user_capability_bitmask(int $userid) : int {
        global $DB;
        $capabilities = 0;
        $context = context_system::instance();
        if (has_capability(self::CAPABILITY_ADMIN, $context, $userid, false)) {
            $capabilities += self::CAPABILITY_ENUMS[self::CAPABILITY_ADMIN];
        }
        if (has_capability(self::CAPABILITY_MANAGER, $context, $userid, false)) {
            $capabilities += self::CAPABILITY_ENUMS[self::CAPABILITY_MANAGER];
        }
        if (has_capability(self::CAPABILITY_TEACHER, $context, $userid, false)) {
            $capabilities += self::CAPABILITY_ENUMS[self::CAPABILITY_TEACHER];
        }
        if (has_capability(self::CAPABILITY_STUDENT, $context, $userid, false)) {
            $capabilities += self::CAPABILITY_ENUMS[self::CAPABILITY_STUDENT];
        }
        return $capabilities;
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
