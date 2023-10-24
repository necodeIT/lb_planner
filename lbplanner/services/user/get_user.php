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

use coding_exception;
use dml_exception;
use external_api;
use external_function_parameters;
use external_single_structure;
use external_value;
use local_lbplanner\helpers\plan_helper;
use local_lbplanner\helpers\user_helper;
use core_user;
use moodle_exception;
use user_picture;

/**
 * Get the data for a user.
 * param userid (optional) gives back the user data with the given ID
 */
class user_get_user extends external_api {
    public static function get_user_parameters() {
        global $USER;
        return new external_function_parameters(array(
            'userid' => new external_value(
                PARAM_INT,
                'The id of the user to get the data for',
                VALUE_DEFAULT,
                $USER->id,
                NULL_NOT_ALLOWED
            ),
        ));
    }

    /**
     * Gives back the data of a user
     * Default: The user who calls this function
     * @param integer $userid (optional) gives back the data of the given user
     * @throws coding_exception
     * @throws dml_exception
     * @throws moodle_exception
     */
    public static function get_user(int $userid) {
        global $USER, $CFG, $PAGE;
        include_once("$CFG->dirroot/user/lib.php");

        self::validate_parameters(self::get_user_parameters(), array('userid' => $userid));
        // Checks if the user is enrolled in LB_Planner.
        if (!user_helper::check_user_exists($userid)) {
            throw new moodle_exception('User does not exist');
        }

        $lbplanneruser = user_helper::get_user($userid);
        // Check if the user is allowed to get the data for this userid.
        if (user_helper::check_access($userid)) {
            $mdluser = (user_get_user_details($USER));
            return array(
                'userid' => $USER->id,
                'username' => $USER->username,
                'firstname' => $USER->firstname,
                'lastname' => $USER->lastname,
                'capabilities' => user_helper::get_user_capability_bitmask($userid),
                'theme' => $lbplanneruser->theme,
                'lang' => $lbplanneruser->language,
                'profileimageurl' => $mdluser['profileimageurl'],
                'planid' => plan_helper::get_plan_id($userid),
                'colorblindness' => $lbplanneruser->colorblindness,
                'displaytaskcount' => $lbplanneruser->displaytaskcount,
                'vintage' => $USER->address,
            );
        } else {
            $mdluser = core_user::get_user($userid, '*', MUST_EXIST);
            return array(
                    'userid' => $mdluser->id,
                    'username' => $mdluser->username,
                    'firstname' => $mdluser->firstname,
                    'lastname' => $mdluser->lastname,
                    'capabilities' => null,
                    'theme' => null,
                    'lang' => null,
                    'profileimageurl' => get_mdl_user_picture($userid),
                    'planid' => null,
                    'colorblindness' => null,
                    'displaytaskcount' => null,
                    'vintage' => $mdluser->address,
                );
        }
    }
    public static function get_user_returns() {
        return new external_single_structure(
            array(
                'userid' => new external_value(PARAM_INT, 'The id of the user'),
                'username' => new external_value(PARAM_TEXT, 'The username of the user'),
                'firstname' => new external_value(PARAM_TEXT, 'The firstname of the user'),
                'lastname' => new external_value(PARAM_TEXT, 'The lastname of the user'),
                'theme' => new external_value(PARAM_TEXT, 'The theme the user has selected'),
                'lang' => new external_value(PARAM_TEXT, 'The language the user has selected'),
                'profileimageurl' => new external_value(PARAM_URL, 'The url of the profile image'),
                'planid' => new external_value(PARAM_INT, 'The id of the plan the user is assigned to'),
                'colorblindness' => new external_value(PARAM_TEXT, 'The colorblindness of the user'),
                'displaytaskcount' => new external_value(PARAM_INT, 'The displaytaskcount of the user'),
                'capabilities' => new external_value(PARAM_INT, 'The capability'),
                'vintage' => new external_value(PARAM_TEXT, 'The vintage of the user')
            )
        );
    }
}
