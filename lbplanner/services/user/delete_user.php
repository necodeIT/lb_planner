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

/**
 * Removes all user data stored by the lbplanner app
 */
class user_delete_user extends external_api {
    public static function delete_user_parameters() {
        return new external_function_parameters(array(
            'userid' => new external_value(
                PARAM_INT,
                'The id of the user to get the data for',
                VALUE_REQUIRED,
                null,
                NULL_NOT_ALLOWED
            ),
        ));
    }

    public static function delete_user($userid) {
        global $DB;
        global $USER;

        $params = self::validate_parameters(self::delete_user_parameters(), array('userid' => $userid));

        // TODO: Check if the token is allowed to delete this user.
        if (!user_helper::check_access($params['userid'])) {
            throw new \moodle_exception('Access denied');
        }

        $user = $DB->get_record(user_helper::TABLE, array('userid' => $params['userid']));
        // TODO: Remove user from a plan if user is not the owner.

        // TODO: Delete plan of the user.
        // TODO: Clear all courses from the user.

        $DB->delete_records(user_helper::TABLE, array('userid' => $params['userid']));

        return array('message' => 'User deleted successfully (TODO)');
    }

    public static function delete_user_returns() {
        return new external_single_structure(
            array('message' => new external_value(PARAM_TEXT, 'The message to return to the user'))
        );
    }
}