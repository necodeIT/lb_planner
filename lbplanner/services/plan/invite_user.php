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
use local_lbplanner\helpers\invite_helper;
use local_lbplanner\helpers\plan_helper;
use local_lbplanner\helpers\notifications_helper;
use local_lbplanner\helpers\PLAN_INVITE_STATE;

/**
 * Invite a user to your plan
 */
class plan_invite_user extends external_api {
    public static function invite_user_parameters() {
        return new external_function_parameters([
            'inviteeid' => new external_value(
                PARAM_INT,
                'The id of the user who gets invited',
                VALUE_REQUIRED,
                null,
                NULL_NOT_ALLOWED
            ),
        ]);
    }

    public static function invite_user($inviteeid) {
        global $DB, $USER;

        self::validate_parameters(
            self::invite_user_parameters(),
            ['inviteeid' => $inviteeid]
        );

        $planid = plan_helper::get_plan_id($USER->id);

        if (plan_helper::get_owner($planid) !== $USER->id) {
            throw new \moodle_exception('Access denied');
        }

        if ($USER->id === $inviteeid) {
            throw new \moodle_exception('Cannot invite yourself');
        }

        if (plan_helper::get_plan_id($inviteeid) == $planid) {
            throw new \moodle_exception('Cannot invite user who is already a member');
        }

        if ($DB->record_exists(
                plan_helper::INVITES_TABLE,
                ['inviteeid' => $inviteeid, 'planid' => $planid, 'status' => PLAN_INVITE_STATE::PENDING->value]
            )) {
            throw new \moodle_exception('User is already invited');
        }

        // Save the invite.
        $invite = new \stdClass();
        $invite->planid = $planid;
        $invite->inviterid = $USER->id;
        $invite->inviteeid = $inviteeid;
        $invite->timestamp = time();
        $invite->status = PLAN_INVITE_STATE::PENDING->value;

        $invite->id = $DB->insert_record(plan_helper::INVITES_TABLE, $invite);

        // Notify the invitee that they've been invited.
        notifications_helper::notify_user(
            $inviteeid,
            $invite->id,
            notifications_helper::TRIGGER_INVITE
        );

        return $invite;
    }

    public static function invite_user_returns() {
        return invite_helper::structure();
    }
}
