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

use dml_exception;
use external_api;
use external_function_parameters;
use external_single_structure;
use external_value;
use local_lbplanner\helpers\user_helper;
use local_lbplanner\helpers\plan_helper;
use local_lbplanner\helpers\course_helper;
use local_lbplanner\helpers\notifications_helper;
use moodle_exception;

/**
 * Removes all user data stored by the lbplanner app
 * Admins can pass a userid to delete the user with the given id
 * @package    local_lbplanner
 * @copyright  2023 LB Planner
 * @license    https://www.gnu.org/copyleft/gpl.html GNU GPL v3 or later
 */
class user_delete_user extends external_api {
    public static function delete_user_parameters(): external_function_parameters {
        global $USER;
        return new external_function_parameters(
            ['userid' => new external_value(
                PARAM_INT,
                'The id of the user to delete',
                VALUE_DEFAULT,
                $USER->id,
                NULL_NOT_ALLOWED
            )]
        );
    }

    /**
     * Removes all user data stored by the lbplanner app
     * @throws dml_exception
     * @throws moodle_exception
     */
    public static function delete_user($userid) {
        global $DB, $USER;

        self::validate_parameters(self::delete_user_parameters(), array('userid' => $userid));

        if (!user_helper::is_admin($USER->id)) {
            user_helper::assert_access($userid);
        }

        // Check if User is in user table.
        if (!$DB->record_exists(user_helper::LB_PLANNER_USER_TABLE, array('userid' => $userid))) {
            throw new moodle_exception('User is not registered in LB Planner');
        }

        $planid = plan_helper::get_plan_id($userid);

        // Check if User is in a plan. If yes, leave the plan first then delete the plan.
        // If the user is the only member of the plan, delete the plan.
        if (
            !(count(plan_helper::get_plan_members($planid)) == 1 )
            &&
            !(plan_helper::get_access_type($planid, $userid) == plan_helper::ACCESS_TYPE_OWNER)) {
            self::call_external_function('local_lbplanner_plan_leave_plan', array('userid' => $userid, 'planid' => $planid));
        }
        $DB->delete_records(plan_helper::DEADLINES_TABLE, array('planid' => $planid));
        $DB->delete_records(plan_helper::TABLE, array('id' => $planid));

        // Delete all Notifications.
        if ($DB->record_exists(notifications_helper::LBPLANNER_NOTIFICATION_TABLE, array('userid' => $userid))) {
            $DB->delete_records(notifications_helper::LBPLANNER_NOTIFICATION_TABLE, array('userid' => $userid));
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
        $DB->delete_records(user_helper::LB_PLANNER_USER_TABLE, array('userid' => $userid));
    }

    public static function delete_user_returns() {
        return null;
    }
}
