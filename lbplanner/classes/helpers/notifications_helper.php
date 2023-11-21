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

/**
 * Provides helper methods for notification related stuff.
 */
class notifications_helper {
    /**
     * Name of the notifications table.
     */
    const LBPLANNER_NOTIFICATION_TABLE = 'local_lbplanner_notification';

    /**
     * Enum value for a read notification.
     */
    const STATUS_READ = 1;

    /**
     * Enum value for a unread notification.
     */
    const STATUS_UNREAD = 0;

    /**
     * Enum value for a notification triggered by an invitation.
     */
    const TRIGGER_INVITE = 0;

    /**
     * Enum value for a notification triggered by an acceptation of an invitation.
     */
    const TRIGGER_INVITE_ACCEPTED = 1;

    /**
     * Enum value for a notification triggered by a rejection of an invitation.
     */
    const TRIGGER_INVITE_DECLINED = 2;

    /**
     * Enum value for a notification triggered by a user leaving a plan.
     */
    const TRIGGER_PLAN_LEFT = 3;

    /**
     * Enum value for a notification triggered by a user being removed from a plan.
     */
    const TRIGGER_PLAN_REMOVED = 4;

    /**
     * Enum value for a notification triggered by a new user.
     */
    const TRIGGER_USER_REGISTERED = 5;

    /**
     * @return external_single_structure The data structure of a module.
     */
    public static function structure() : external_single_structure {
        return new external_single_structure(
        array(
            'moduleid' => new external_value(PARAM_INT, 'The id of the module'),
            'name' => new external_value(PARAM_TEXT, 'The name of the module'),
            'courseid' => new external_value(PARAM_INT, 'The id of the course'),
            'status' => new external_value(PARAM_INT, 'The status of the module'),
            'type' => new external_value(PARAM_INT, 'The type of the module'),
            'url' => new external_value(PARAM_TEXT, 'The url of the module in moodle'),
            'grade' => new external_value(PARAM_INT, 'The grade of the module'),
            'deadline' => new external_value(PARAM_INT, 'The deadline of the module set by the teacher'),
        )
        );
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
        $notification->status = self::STATUS_UNREAD;
        $notification->timestamp = time();
        $notification->timestamp_read = null;

        $id = $DB->insert_record(self::LBPLANNER_NOTIFICATION_TABLE, $notification);

        return $id;
    }
}
