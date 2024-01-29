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
use local_lbplanner\helpers\NOTIF_TRIGGER;
use local_lbplanner\helpers\plan_helper;
use local_lbplanner\helpers\notifications_helper;
use local_lbplanner\helpers\PLAN_INVITE_STATE;

/**
 * Decline an invite from the plan.
 *
 * @package local_lbplanner
 * @subpackage services_plan
 * @copyright 2024 necodeIT
 * @license http://www.gnu.org/copyleft/gpl.html GNU GPL v3 or later
 */
class plan_decline_invite extends external_api {
    public static function decline_invite_parameters() {
        return new external_function_parameters([
        'inviteid' => new external_value(PARAM_INT, 'the ID of the invite to be declined', VALUE_REQUIRED, null, NULL_NOT_ALLOWED),
        ]);
    }

    public static function decline_invite($inviteid) {
        global $DB, $USER;

        self::validate_parameters(self::decline_invite_parameters(), [
        'inviteid' => $inviteid,
        ]);

        if (!$DB->record_exists(plan_helper::INVITES_TABLE, ['id' => $inviteid, 'inviteeid' => $USER->id])) {
            throw new \moodle_exception('Invite not found');
        }

        $invite = $DB->get_record(plan_helper::INVITES_TABLE,
        [
            'id' => $inviteid,
            'inviteeid' => $USER->id,
        ],
        '*',
        MUST_EXIST
        );

        if ($invite->status !== PLAN_INVITE_STATE::PENDING) {
            throw new \moodle_exception('Invite already accepted or declined');
        }

        // Notify the user that invite has been declined.
        notifications_helper::notify_user(
            $invite->inviterid,
            $invite->id,
            NOTIF_TRIGGER::INVITE_DECLINED
        );

        $invite->status = PLAN_INVITE_STATE::DECLINED;

        $DB->update_record(plan_helper::INVITES_TABLE, $invite);
    }


    public static function decline_invite_returns() {
        return null;
    }
}
