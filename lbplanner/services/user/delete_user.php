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

use core_competency\plan;
use external_api;
use external_function_parameters;
use external_single_structure;
use external_value;
use local_lbplanner\helpers\user_helper;
use local_lbplanner\helpers\plan_helper;
use local_lbplanner\helpers\course_helper;
use local_lbplanner\helpers\notifications_helper;

/**
 * Removes all user data stored by the lbplanner app
 */
class user_delete_user extends external_api {
    public static function delete_user_parameters() {
        return new external_function_parameters(array(
            'userid' => new external_value(
                PARAM_INT,
                'The id of the user to get the data for',
                VALUE_REQUIRED,
                null,
                NULL_NOT_ALLOWED
            ),
        ));
    }

    public static function delete_user($userid) {
        global $DB;
        self::validate_parameters(self::delete_user_parameters(), array('userid' => $userid));

        user_helper::assert_access($userid);

        // Check if User is in user table.
        if (!$DB->record_exists(user_helper::TABLE, array('userid' => $userid))) {
            throw new \moodle_exception('Access denied');
        }

        $planid = plan_helper::get_plan_id($userid);

        if (plan_helper::get_access_type($planid, $userid) == plan_helper::ACCESS_TYPE_OWNER) {
            if (plan_helper::get_plan_members($planid) > 1) {
                self::call_external_function('local_lbplanner_plan_leave_plan', array('userid' => $userid, 'planid' => $planid));
            } else {
                // Deleting Plan.
                $DB->delete_records(plan_helper::DEADLINES_TABLE, array('planid' => $planid));
                $DB->delete_records(plan_helper::TABLE, array('id' => $planid));
            }
        }
        // Delete all Notifications.
        if ($DB->record_exists(notifications_helper::TABLE, array('userid' => $userid))) {
            $DB->delete_records(notifications_helper::TABLE, array('userid' => $userid));
        }

        $invites = plan_helper::get_invites_send($userid);
        foreach ($invites as $invite) {
            if ($invite->status == plan_helper::INVITE_PENDING) {
                $invite->status = plan_helper::INVITE_EXPIRED;
                $DB->update_record(plan_helper::INVITES_TABLE, $invite);
            }
        }
        // Deleting associating with the plan.
        $DB->delete_records(plan_helper::ACCESS_TABLE, array('userid' => $userid));

        // Deleting all Courses associated with the User.
        $DB->delete_records(course_helper::LBPLANNER_COURSE_TABLE, array('userid' => $userid));
        // Deleting User from User table.
        $DB->delete_records(user_helper::TABLE, array('userid' => $userid));

        return array('message' => 'User deleted successfully');
    }

    public static function delete_user_returns() {
        return new external_single_structure(
            array('message' => new external_value(PARAM_TEXT, 'The message to return to the user'))
        );
    }
}
