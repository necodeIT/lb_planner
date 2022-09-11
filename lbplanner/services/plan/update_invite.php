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
 * THIS METHOD IS NOT USED ANYMORE. JUST TO KEEP OLD CODE FOR REFERENCE.
 */
class plan_update_invite extends external_api {
    public static function update_invite_parameters() {
        return new external_function_parameters(array(
        'planid' => new external_value(PARAM_INT, 'The id of the plan', VALUE_REQUIRED, null, NULL_NOT_ALLOWED),
        'userid' => new external_value(PARAM_INT, 'The id of the invited user', VALUE_REQUIRED, null, NULL_NOT_ALLOWED),
        'status' => new external_value(PARAM_INT, 'The status of the invite', VALUE_REQUIRED, null, NULL_NOT_ALLOWED),
        ));
    }

    public static function update_invite($planid, $userid, $status) {
        global $DB;

        self::validate_parameters(self::update_invite_parameters(), array(
        'planid' => $planid,
        'userid' => $userid,
        'status' => $status,
        ));

        user_helper::assert_access($userid);

        if ($status != plan_helper::INVITE_ACCEPTED && $status != plan_helper::INVITE_DECLINED) {
            throw new \moodle_exception('Invalid status');
        }

        $invite = $DB->get_record(plan_helper::INVITES_TABLE,
        array(
            'planid' => $planid,
            'inviteeid' => $userid,
        ),
        '*',
        MUST_EXIST
        );

        if ($invite->status != plan_helper::INVITE_PENDING) {
            throw new \moodle_exception('Invalid status');
        }

        $invite->status = $status;

        $DB->update_record(plan_helper::INVITES_TABLE, $invite);

        $trigger = $status == plan_helper::INVITE_ACCEPTED ?
        notifications_helper::TRIGGER_INVITE_ACCEPTED
        : notifications_helper::TRIGGER_INVITE_DECLINED;

        notifications_helper::notify_user($invite->inviterid, $userid , $trigger);

        // TODO: Change plan access and delete old plan if inivite is accepted.

        if ($status == plan_helper::INVITE_ACCEPTED) {
            $oldplanid = plan_helper::get_plan_id($userid);

            if (plan_helper::get_owner($oldplanid) == $userid) {

                foreach (plan_helper::get_plan_members($oldplanid) as $member) {
                    if ($member->userid != $userid) {
                        plan_leave_plan::leave_plan($member->userid, $oldplanid);
                    }
                }
                self::call_external_function('local_lbplanner_plan_clear_plan', array ($userid, $oldplanid));

                $DB->delete_records(plan_helper::TABLE, array('id' => $oldplanid));
            }

            $planaccess = $DB->get_record(
                plan_helper::ACCESS_TABLE,
                array(
                    'planid' => $oldplanid,
                    'userid' => $userid
                ),
                '*',
                MUST_EXIST
            );

            $planaccess->accesstype = plan_helper::ACCESS_TYPE_READ;
            $planaccess->planid = $planid;

            $DB->update_record(plan_helper::ACCESS_TABLE, $planaccess);

            $DB->delete_records(plan_helper::INVITES_TABLE, array('id' => $invite->id));
        }
        return array(
            'inviterid' => $invite->inviterid,
            'inviteeid' => $invite->inviteeid,
            'planid' => $invite->planid,
            'status' => $invite->status,
            'timestamp' => $invite->timestamp,
        );
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
