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
use external_single_structure;
use external_value;
use local_lbplanner\helpers\user_helper;


class user_register_user extends external_api {
    public static function register_user_parameters() {
        return new external_function_parameters(array(
            'userid' => new external_value(PARAM_INT, 'The id of the user to register', VALUE_REQUIRED, null, NULL_NOT_ALLOWED),
            'lang' => new external_value(PARAM_TEXT, 'The language the user has selected', VALUE_REQUIRED, null, NULL_NOT_ALLOWED),
            'theme' => new external_value(PARAM_TEXT, 'The theme the user has selected', VALUE_REQUIRED, null, NULL_NOT_ALLOWED),
        ));
    }

    public static function register_user($userid, $lang, $theme) {
        global $DB;
        global $USER;

        self::validate_parameters(
            self::register_user_parameters(),
            array('userid' => $userid, 'lang' => $lang, 'theme' => $theme)
        );

        if (!user_helper::check_access($userid)) {
            throw new \moodle_exception('Access denied');
        }

        // Check if the user is already registered.
        if (user_helper::check_user_exists($userid)) {
            throw new \moodle_exception('User already registered');
        }

        $user = new \stdClass();
        $user->userid = $userid;
        $user->language = $lang;
        $user->theme = $theme;
        $user->role = user_helper::determin_user_role($userid);

        $DB->insert_record(user_helper::table(), $user);

        // TODO: Create a new plan for the user.

        $mdluser = user_helper::get_mdl_user_info($userid);

        $plan = new \stdClass();
        $plan->name = 'Plan for ' . $mdluser->firstname;
        $plan->enableek = 0;

        $planid = $DB->insert_record('local_lbplanner_plans', $plan);

        $planaccess = new \stdClass();
        $planaccess->userid = $userid;
        $planaccess->accestype = 0;
        $planaccess->planid = $planid;

        $DB->insert_record('local_lbplanner_plan_access', $planaccess);

        return array(
            'userid' => $user->userid,
            'username' => $mdluser->username,
            'firstname' => $mdluser->firstname,
            'lastname' => $mdluser->lastname,
            'role' => $user->role,
            'theme' => $user->theme,
            'lang' => $user->language,
            'profileimageurl' => $mdluser->profileimageurl,
        );
    }

    public static function register_user_returns() {
        return new external_single_structure(
            array(
                'userid' => new external_value(PARAM_INT, 'The id of the user'),
                'username' => new external_value(PARAM_TEXT, 'The username of the user'),
                'firstname' => new external_value(PARAM_TEXT, 'The firstname of the user'),
                'lastname' => new external_value(PARAM_TEXT, 'The lastname of the user'),
                'role' => new external_value(PARAM_INT, 'The role of the user'),
                'theme' => new external_value(PARAM_TEXT, 'The theme the user has selected'),
                'lang' => new external_value(PARAM_TEXT, 'The language the user has selected'),
                'profileimageurl' => new external_value(PARAM_URL, 'The url of the profile image'),
            )
        );
    }
}
