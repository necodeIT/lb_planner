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
use local_lbplanner\helpers\notifications_helper;

/**
 * Leave the plan of the given user.
 */
class plan_leave_plan extends external_api {
    public static function leave_plan_parameters() {
        return new external_function_parameters(array(
            'userid' => new external_value(
                PARAM_INT,
                'The id of the user to get the data for',
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

    public static function leave_plan($userid, $planid) {
        global $DB;

        self::validate_parameters(self::leave_plan_parameters(), array('userid' => $userid, 'planid' => $planid));

        user_helper::assert_access($userid);

        if (plan_helper::get_access_type($userid, $planid) == plan_helper::ACCESS_TYPE_NONE) {
            throw new \moodle_exception('User is not a member of this plan');
        }

        if (plan_helper::get_access_type($userid, $planid) == plan_helper::ACCESS_TYPE_OWNER) {
            $members = plan_helper::get_plan_members($planid);

            if (count($members) == 1) {
                throw new \moodle_exception('Cannot Leave Plan: Plan must have at least one other member');
            }

            $writemembers = array();
            $allmembers = array();
            foreach ($members as $member) {
                if ($member->userid == $userid) {
                    continue;
                }
                if ($member->accesstype == plan_helper::ACCESS_TYPE_WRITE) {
                    $writemembers[] = $member;
                }
                $allmembers[] = $member;
            }
            if (count($writemembers) > 0) {
                $newowner = $writemembers[rand( 0, count($writemembers) - 1)]->userid;
            } else {
                $newowner = $allmembers[rand( 0, count($allmembers) - 1)]->userid;
            }
            $newowneraccess = $DB->get_record(
                plan_helper::ACCESS_TABLE,
                array('planid' => $planid, 'userid' => $newowner), '*', MUST_EXIST
            );
            $newowneraccess->accesstype = plan_helper::ACCESS_TYPE_OWNER;
            $DB->update_record(plan_helper::ACCESS_TABLE, $newowneraccess);
        }

        $newplanid = plan_helper::copy_plan($planid, $userid);

        $oldaccess = $DB->get_record(
            plan_helper::ACCESS_TABLE,
            array('planid' => $planid, 'userid' => $userid), '*', MUST_EXIST
        );

        $oldaccess->planid = $newplanid;
        $oldaccess->accesstype = plan_helper::ACCESS_TYPE_OWNER;

        $DB->update_record(plan_helper::ACCESS_TABLE, $oldaccess);

        // Notify plan owner that user has left his plan.
        $invites = plan_helper::get_invites_send($userid);
        foreach ($invites as $invite) {
            if ($invite->status == plan_helper::INVITE_PENDING) {
                $invite->status = plan_helper::INVITE_EXPIRED;
                $DB->update_record(plan_helper::INVITES_TABLE, $invite);
            }
        }

        notifications_helper::notify_user(
            plan_helper::get_owner($planid),
            $userid,
            notifications_helper::TRIGGER_PLAN_LEFT
        );

        return plan_helper::get_plan($planid, $userid);
    }
    public static function leave_plan_returns() {
        return plan_helper::plan_structure();
    }
}
