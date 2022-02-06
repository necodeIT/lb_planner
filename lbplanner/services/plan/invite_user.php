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

class plan_invite_user extends external_api {
    public static function leave_plan_parameters() {
        return new external_function_parameters(array(
            'inviterid' => new external_value(
                PARAM_INT,
                'The id of the Owner of the plan',
                VALUE_REQUIRED,
                null,
                NULL_NOT_ALLOWED
            ),
            'inviteeid' => new external_value(
                PARAM_INT,
                'The id of the user who gets invited',
                VALUE_REQUIRED,
                null,
                NULL_NOT_ALLOWED
            ),
            'planid' => new external_value(
                PARAM_INT,
                'The id of the plan',
                VALUE_REQUIRED,
                null,
                NULL_NOT_ALLOWED
            ),
        ));
    }

    public static function invite_user($inviterid, $inviteuserid , $planid) {
        global $DB;
        global $USER;

        $params = self::validate_parameters(
            self::leave_plan_parameters(),
            array('userid' => $inviterid, 'inviteeid' => $inviteuserid, 'planid' => $planid)
        );

        // TODO: Check if the token is from the same User as the UserId.
        // TODO: Check if Invited User is Valid.
        // TODO: Add Owner/Invitation/Time/Status/PlanId to the Invitation DB.

        return array();
    }

    public static function invite_user_returns() {
        return new external_single_structure(
            array(
                'inviterid' => new external_value(PARAM_INT, 'The id of the owner user'),
                'inviteeid' => new external_value(PARAM_INT, 'The id of the invited user'),
                'planid' => new external_value(PARAM_INT, 'The id of the plan'),
                'status' => new external_value(PARAM_INT, 'The Status of the invitation'),
                'timestamp' => new external_value(PARAM_INT, 'The time when the invitation was send'),
                )
        );
    }
}
