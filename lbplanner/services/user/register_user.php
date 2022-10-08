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
use local_lbplanner\helpers\plan_helper;
use local_lbplanner\helpers\notifications_helper;

/**
 * Register a new user in the lbplanner app.
 */
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

        self::validate_parameters(
            self::register_user_parameters(),
            array('userid' => $userid, 'lang' => $lang, 'theme' => $theme)
        );

        user_helper::assert_access($userid);

        if (user_helper::check_user_exists($userid)) {
            throw new \moodle_exception('User already registered');
        }

        $user = new \stdClass();
        $user->userid = $userid;
        $user->language = $lang;
        $user->theme = $theme;
        $user->colorblindness = "none";

        $DB->insert_record(user_helper::TABLE, $user);

        $mdluser = user_helper::get_mdl_user_info($userid);

        $plan = new \stdClass();
        $plan->name = 'Plan for ' . $mdluser->firstname;
        $plan->enableek = plan_helper::EK_DISABLED;

        $planid = $DB->insert_record(plan_helper::TABLE, $plan);

        $planaccess = new \stdClass();
        $planaccess->userid = $userid;
        $planaccess->accesstype = plan_helper::ACCESS_TYPE_OWNER;
        $planaccess->planid = $planid;

        $DB->insert_record(plan_helper::ACCESS_TABLE, $planaccess);

        notifications_helper::notify_user($userid, -1, notifications_helper::TRIGGER_USER_REGISTERED);

        return array(
            'userid' => $user->userid,
            'username' => $mdluser->username,
            'firstname' => $mdluser->firstname,
            'lastname' => $mdluser->lastname,
            'capabilities' => user_helper::get_user_capability_bitmask($userid),
            'theme' => $user->theme,
            'lang' => $user->language,
            'profileimageurl' => $mdluser->profileimageurl,
            'planid' => $planid,
            'colorblindness' => $user->colorblindness,
        );
    }

    public static function register_user_returns() {
        return new external_single_structure(
            array(
                'userid' => new external_value(PARAM_INT, 'The id of the user'),
                'username' => new external_value(PARAM_TEXT, 'The username of the user'),
                'firstname' => new external_value(PARAM_TEXT, 'The firstname of the user'),
                'lastname' => new external_value(PARAM_TEXT, 'The lastname of the user'),
                'capabilities' => new external_value(PARAM_INT, 'The capability'),
                'theme' => new external_value(PARAM_TEXT, 'The theme the user has selected'),
                'lang' => new external_value(PARAM_TEXT, 'The language the user has selected'),
                'profileimageurl' => new external_value(PARAM_URL, 'The url of the profile image'),
                'planid' => new external_value(PARAM_INT, 'The id of the plan the user is assigned to'),
                'colorblindness' => new external_value(PARAM_TEXT, 'The colorblindness of the user'),
            )
        );
    }
}
