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

/**
 * Provides helper methods for notification related stuff.
 */
class notifications_helper {
    /**
     * Name of the notifications table.
     */
    const TABLE = 'local_lbplanner_notification';

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

        $id = $DB->insert_record(self::TABLE, $notification);

        return $id;
    }
}
