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
 * Update a invite from the plan.
 */
class plan_accept_invite extends external_api {
    public static function accept_invite_parameters() {
        return new external_function_parameters(array(
        'inviteid' => new external_value(PARAM_INT, 'The id of the plan', VALUE_REQUIRED, null, NULL_NOT_ALLOWED),
        'userid' => new external_value(PARAM_INT, 'The id of the invited user', VALUE_REQUIRED, null, NULL_NOT_ALLOWED)
        ));
    }

    public static function accept_invite($inviteid, $userid) {
        global $DB;

        self::validate_parameters(self::accept_invite_parameters(), array(
        'inviteid' => $inviteid,
        'userid' => $userid,
        ));

        user_helper::assert_access($userid);

        if (!$DB->record_exists(plan_helper::INVITES_TABLE, array('id' => $inviteid, 'inviteeid' => $userid))) {
            throw new \moodle_exception('Invite not found');
        }
        if (!$DB->record_exists(plan_helper::INVITES_TABLE,
        array( 'id' => $inviteid, 'inviteeid' => $userid, 'status' => plan_helper::INVITE_PENDING))) {
            throw new \moodle_exception('Invite already accepted or declined');
        }

        $invite = $DB->get_record(plan_helper::INVITES_TABLE,
        array(
            'id' => $inviteid,
            'inviteeid' => $userid,
            'status' => plan_helper::INVITE_PENDING,
        ),
        '*',
        MUST_EXIST
        );

        // Notify the user that invite has been accepted.
        notifications_helper::notify_user(
            $invite->inviterid,
            $invite->id,
            notifications_helper::TRIGGER_INVITE_ACCEPTED
        );

        // If the User is the User has Member in his plan, then removes it.
        $oldplanid = plan_helper::get_plan_id($userid);
        if (plan_helper::get_owner($oldplanid) == $userid) {

            foreach (plan_helper::get_plan_members($oldplanid) as $member) {
                if ($member->userid != $userid) {
                    self::call_external_function('local_lbplanner_plan_remove_user', array(
                        'planid' => $oldplanid,
                        'userid' => $member->userid
                    ));
                }
            }
            self::call_external_function('local_lbplanner_plan_clear_plan', array(
                'planid' => $oldplanid,
                'userid' => $userid
            ));
            $DB->delete_records(plan_helper::TABLE, array('id' => $oldplanid));
        }
        // Updates the plan access.
        $planaccess = $DB->get_record(
            plan_helper::ACCESS_TABLE,
            array(
                'planid' => $oldplanid,
                'userid' => $userid
            ),
            '*',
            MUST_EXIST
        );

        $invite->status = plan_helper::INVITE_ACCEPTED;

        $DB->update_record(plan_helper::INVITES_TABLE, $invite);

        $planaccess->accesstype = plan_helper::ACCESS_TYPE_READ;
        $planaccess->planid = $invite->planid;

        $DB->update_record(plan_helper::ACCESS_TABLE, $planaccess);
        $invites = plan_helper::get_invites_send($userid);
        foreach ($invites as $invite) {
            if ($invite->status == plan_helper::INVITE_PENDING) {
                $invite->status = plan_helper::INVITE_EXPIRED;
                $DB->update_record(plan_helper::INVITES_TABLE, $invite);
            }
        }

        return array(
        'id' => $invite->id,
        'inviterid' => $invite->inviterid,
        'inviteeid' => $invite->inviteeid,
        'planid' => $invite->planid,
        'status' => $invite->status,
        'timestamp' => $invite->timestamp,
        );
    }


    public static function accept_invite_returns() {
        return new external_single_structure(
            array(
                'id' => new external_value(PARAM_INT, 'The id of the invite'),
                'inviterid' => new external_value(PARAM_INT, 'The id of the owner user'),
                'inviteeid' => new external_value(PARAM_INT, 'The id of the invited user'),
                'planid' => new external_value(PARAM_INT, 'The id of the plan'),
                'status' => new external_value(PARAM_INT, 'The Status of the invitation'),
                'timestamp' => new external_value(PARAM_INT, 'The time when the invitation was send'),
            )
        );
    }
}
