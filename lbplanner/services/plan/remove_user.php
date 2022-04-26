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
use external_value;
use local_lbplanner\helpers\plan_helper;
use local_lbplanner\helpers\user_helper;

/**
 * Remove a user from the plan.
 */
class plan_remove_user extends external_api {
    public static function remove_user_parameters() {
        return new external_function_parameters(array(
            'userid' => new external_value(PARAM_INT, 'The id of the user', VALUE_REQUIRED, null, NULL_NOT_ALLOWED),
            'removeuserid' => new external_value(PARAM_INT, 'The id of the user to remove', VALUE_REQUIRED, null, NULL_NOT_ALLOWED),
            'planid' => new external_value(PARAM_INT, 'The id of the plan', VALUE_REQUIRED, null, NULL_NOT_ALLOWED),
        ));
    }

    public static function remove_user($userid, $removeuserid, $planid) {
        global $DB;

        self::validate_parameters(
            self::remove_user_parameters(),
            array('userid' => $userid, 'removeuserid' => $removeuserid, 'planid' => $planid)
        );

        user_helper::assert_access($userid);

        return plan_helper::remove_user($planid, $userid, $removeuserid);
    }

    public static function remove_user_returns() {
        return plan_helper::plan_structure();
    }
}
