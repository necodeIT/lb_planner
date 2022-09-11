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
use local_lbplanner\helpers\plan_helper;
use local_lbplanner\helpers\user_helper;
use local_lbplanner\helpers\notifications_helper;

/**
 * Invite a user to the plan.
 */
class plan_invite_user extends external_api {
    public static function invite_user_parameters() {
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

    public static function invite_user($inviterid, $inviteeid , $planid) {
        global $DB;

        self::validate_parameters(
            self::invite_user_parameters(),
            array('inviterid' => $inviterid, 'inviteeid' => $inviteeid, 'planid' => $planid)
        );

        user_helper::assert_access($inviterid);
        if (plan_helper::get_owner($planid) != $inviterid) {
            throw new \moodle_exception('Access denied');
        }

        if ($inviterid == $inviteeid) {
            throw new \moodle_exception('Cannot invite yourself');
        }

        if (plan_helper::get_plan_id($inviteeid) == $planid) {
            throw new \moodle_exception('Cannot invite user who is already a member');
        }

        if ($DB->record_exists(
                plan_helper::INVITES_TABLE,
                array('inviteeid' => $inviteeid, 'planid' => $planid, 'status' => plan_helper::INVITE_PENDING)
            )) {
            throw new \moodle_exception('User is already invited');
        }

        $invitee = user_helper::get_mdl_user_info($inviteeid);
        $inviter = user_helper::get_mdl_user_info($inviterid);

        if ($invitee->address != $inviter->address) {
            throw new \moodle_exception('Cannot invite user who is not in the same class');
        }

        // Save the invite.
        $invite = new \stdClass();
        $invite->planid = $planid;
        $invite->inviterid = $inviterid;
        $invite->inviteeid = $inviteeid;
        $invite->timestamp = time();
        $invite->status = plan_helper::INVITE_PENDING;

        $invite->id = $DB->insert_record(plan_helper::INVITES_TABLE, $invite);

        // Notifiy the invitee that he/she/it/they/xier/* has been invited.
        notifications_helper::notify_user(
            $inviteeid,
            $invite->id,
            notifications_helper::TRIGGER_INVITE
        );

        return array(
            'id' => $invite->id,
            'inviterid' => $inviterid,
            'inviteeid' => $inviteeid,
            'planid' => $planid,
            'timestamp' => $invite->timestamp,
            'status' => $invite->status
        );
    }

    public static function invite_user_returns() {
        return new external_single_structure(
            array(
                'id' => new external_value(PARAM_INT, 'The id of the invite'),
                'inviterid' => new external_value(PARAM_INT, 'The id of the owner user'),
                'inviteeid' => new external_value(PARAM_INT, 'The id of the invited user'),
                'planid' => new external_value(PARAM_INT, 'The id of the plan'),
                'status' => new external_value(PARAM_INT, 'The status of the invitation'),
                'timestamp' => new external_value(PARAM_INT, 'The time when the invitation was send'),
            )
        );
    }
}
