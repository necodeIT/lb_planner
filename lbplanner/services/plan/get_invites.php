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

use block_recentlyaccesseditems\external;
use external_api;
use external_function_parameters;
use external_single_structure;
use external_multiple_structure;
use external_value;

class plan_get_invites extends external_api {
    public static function get_invites_parameters() {
        return new external_function_parameters(array(
            'userid' => new external_value(
                PARAM_INT,
                'The id of the Owner of the plan',
                VALUE_REQUIRED,
                null,
                NULL_NOT_ALLOWED
            ),
        ));
    }

    public static function get_invites($userid) {
        global $DB;
        global $USER;

        self::validate_parameters(
            self::get_invites_parameters(),
            array('userid' => $userid)
        );

        // TODO: Check if the token is from the same User as the UserId.
        // TODO: Check if user has been invited.
        // TODO: Check if user has invited somone.

        return array();
    }

    public static function get_invites_returns() {
        return new external_multiple_structure(
            new external_single_structure(
                array(
                    'inviterid' => new external_value(PARAM_INT, 'The id of the owner user'),
                    'inviteeid' => new external_value(PARAM_INT, 'The id of the invited user'),
                    'planid' => new external_value(PARAM_INT, 'The id of the plan'),
                    'status' => new external_value(PARAM_INT, 'The Status of the invitation'),
                    'timestamp' => new external_value(PARAM_INT, 'The time when the invitation was send'),
                    )
            )
        );
    }
}
