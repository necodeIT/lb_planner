<?php
// This file is part of the local_lbplanner.
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

namespace local_lbplanner\helpers;

use external_single_structure;
use external_value;

// TODO: revert to native enums once we migrate to php8

use local_lbplanner\polyfill\Enum;

/**
 * Stati a notification can be in
 */
class NOTIF_STATUS extends Enum {
    const UNREAD = 0;
    const READ = 1;
}

class NOTIF_TRIGGER extends Enum {
    const INVITE = 0;
    const INVITE_ACCEPTED = 1;
    const INVITE_DECLINED = 2;
    const PLAN_LEFT = 3;
    const PLAN_REMOVED = 4;
    const USER_REGISTERED = 5;
}

/**
 * Provides helper methods for notification related stuff.
 */
class notifications_helper {
    /**
     * Name of the notifications table.
     */
    const LBPLANNER_NOTIFICATION_TABLE = 'local_lbplanner_notification';

    /**
     * @return external_single_structure The data structure of a module.
     */
    public static function structure() : external_single_structure {
        return new external_single_structure([
            'status' => new external_value(PARAM_INT, 'The status of the notification '.NOTIF_STATUS::format()),
            'type' => new external_value(PARAM_INT, 'The type of the event that triggered the notification '.NOTIF_TRIGGER::format()),
            'info' => new external_value(PARAM_INT, 'Additional information about the notification'),
            'userid' => new external_value(PARAM_INT, 'The ID of the user for whom the notification is for'),
            'notificationid' => new external_value(PARAM_INT, 'The ID of the notification', NULL_NOT_ALLOWED),
            'timestamp' => new external_value(PARAM_INT, 'The timestamp of the notification'),
            'timestamp_read' => new external_value(PARAM_INT, 'The timestamp of the notification when it was read'),
        ]);
    }

    /**
     * Notifies the given user about the given event, with the given info.
     *
     * @param integer $userid The user to notify.
     * @param integer $info Additional information as stringified json.
     * @param integer $type The type of notification.
     * @return integer The id of the notification.
     */
    public static function notify_user( int $userid, int $info, int $type ): int {
        global $DB;

        $notification = new \stdClass();
        $notification->userid = $userid;
        $notification->info = $info;
        $notification->type = $type;
        $notification->status = NOTIF_STATUS::UNREAD;
        $notification->timestamp = time();
        $notification->timestamp_read = null;

        $id = $DB->insert_record(self::LBPLANNER_NOTIFICATION_TABLE, $notification);

        return $id;
    }
}
