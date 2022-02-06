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

class plan_update_invite extends external_api {
    public static function update_invite_parameters() {
        return new external_function_parameters(array(
            'planid' => new external_value(PARAM_INT, 'The id of the plan', VALUE_REQUIRED, null, NULL_NOT_ALLOWED),
            'inviterid' => new external_value(PARAM_INT, 'The id of the user', VALUE_REQUIRED, null, NULL_NOT_ALLOWED),
            'inviteeid' => new external_value(PARAM_INT, 'The id of the invited user', VALUE_REQUIRED, null, NULL_NOT_ALLOWED),
            'status' => new external_value(PARAM_INT, 'The status of the invite', VALUE_REQUIRED, null, NULL_NOT_ALLOWED),
        ));
    }

    public static function update_invite($planid, $inviterid, $inviteeid, $status) {
        global $DB;
        global $USER;

        $params = self::validate_parameters(self::update_invite_parameters(), array(
            'planid' => $planid,
            'inviterid' => $inviterid,
            'inviteeid' => $inviteeid,
            'status' => $status,
        ));

        // TODO: Check if token is allowed to access this function.

        return array();
    }

    public static function update_invite_returns() {
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
