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
use local_lbplanner\helpers\notifications_helper;

/**
 * Update the notification status of the given user and id.
 */
class notifications_update_notification extends external_api {
    public static function update_notification_parameters() {
        return new external_function_parameters(array(
            'userid' => new external_value(PARAM_INT, 'User ID', VALUE_REQUIRED, null, NULL_NOT_ALLOWED),
            'status' => new external_value(
                PARAM_INT,
                'The status of the notification {0: unread, 1: read}',
                VALUE_REQUIRED,
                null,
                NULL_NOT_ALLOWED
            ),
            'notificationid' => new external_value(PARAM_INT, 'The ID of the notification', VALUE_REQUIRED, null, NULL_NOT_ALLOWED),
        ));
    }

    public static function update_notification($userid, $status, $notificationid) {
        global $DB;

        self::validate_parameters(
            self::update_notification_parameters(),
            array('userid' => $userid, 'status' => $status, 'notificationid' => $notificationid)
        );

        user_helper::assert_access($userid);

        if (!$DB->record_exists(notifications_helper::TABLE, array('id' => $notificationid))) {
            throw new \moodle_exception('Notification does not exist');
        }

        $notification = $DB->get_record(notifications_helper::TABLE, array('id' => $notificationid), '*', MUST_EXIST);
        $notification->status = $status;
        $notification->timestamp_read = time();

        $DB->update_record(notifications_helper::TABLE, $notification);

        return array(
            'status' => $notification->status,
            'type' => $notification->type,
            'info' => $notification->info,
            'userid' => $notification->userid,
            'notificationid' => $notification->id,
            'timestamp' => $notification->timestamp,
            'timestamp_read' => $notification->timestamp_read,
        );
    }

    public static function update_notification_returns() {
        return new external_single_structure(
            array(
                'status' => new external_value(PARAM_INT, 'The status of the notification {0: unread, 1: read}'),
                'type' => new external_value(PARAM_INT, 'The type of the event that triggered the notification'),
                'info' => new external_value(PARAM_INT, 'Additional information about the notification'),
                'userid' => new external_value(PARAM_INT, 'The ID of the user for whom the notification is for'),
                'notificationid' => new external_value(PARAM_INT, 'The ID of the notification'),
                'timestamp' => new external_value(PARAM_INT, 'The timestamp of the notification'),
                'timestamp_read' => new external_value(PARAM_INT, 'The timestamp of the notification'),
            )
        );
    }
}
