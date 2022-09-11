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
use external_multiple_structure;
use external_single_structure;
use external_value;
use local_lbplanner\helpers\user_helper;
use local_lbplanner\helpers\notifications_helper;

/**
 * Get all the notifications of the given user.
 */
class notifications_get_all_notifications extends external_api {
    public static function get_all_notifications_parameters() {
        return new external_function_parameters(array(
            'userid' => new external_value(PARAM_INT, 'User ID', VALUE_REQUIRED, null, NULL_NOT_ALLOWED),
        ));
    }

    public static function get_all_notifications($userid) {
        global $DB;

        self::validate_parameters(self::get_all_notifications_parameters(), array('userid' => $userid));

        user_helper::assert_access($userid);

        $dbnotifications = $DB->get_records(notifications_helper::TABLE, array('userid' => $userid));

        $notifications = array();

        foreach ($dbnotifications as $dbnotification) {
            $notifications[] = array(
                'status' => $dbnotification->status,
                'type' => $dbnotification->type,
                'info' => $dbnotification->info,
                'userid' => $dbnotification->userid,
                'notificationid' => $dbnotification->id,
                'timestamp' => $dbnotification->timestamp,
                'timestamp_read' => $dbnotification->timestamp_read,
            );
        }
        return $notifications;
    }

    public static function get_all_notifications_returns() {
        return new external_multiple_structure(
            new external_single_structure(
                array(
                    'status' => new external_value(PARAM_INT, 'The status of the notification {0: unread, 1: read}'),
                    'type' => new external_value(PARAM_INT, 'The type of the event that triggered the notification'),
                    'info' => new external_value(PARAM_INT, 'Additional information about the notification'),
                    'userid' => new external_value(PARAM_INT, 'The ID of the user for whom the notification is for'),
                    'notificationid' => new external_value(PARAM_INT, 'The ID of the notification', NULL_NOT_ALLOWED),
                    'timestamp' => new external_value(PARAM_INT, 'The timestamp of the notification'),
                    'timestamp_read' => new external_value(PARAM_INT, 'The timestamp of the notification when it was read'),
                )
            )
        );
    }
}
