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

class notifications_helper {
    const TABLE = 'local_lbplanner_notification';

    const STATUS_READ = 1;
    const STATUS_UNREAD = 0;

    const TRIGGER_INVITE = 0;
    const TRIGGER_INVITE_ACCEPTED = 1;
    const TRIGGER_INVITE_DECLINED = 2;
    const TRIGGER_PLAN_LEFT = 3;
    const TRIGGER_PLAN_REMOVED = 4;
    const TRIGGER_USER_REGISTERED = 5;

    public static function notify_user( int $userid, string $info, int $type ): int {
        global $DB;

        $notification = new \stdClass();
        $notification->userid = $userid;
        $notification->info = $info;
        $notification->type = $type;
        $notification->status = self::STATUS_UNREAD;
        $notification->timestamp = time();

        $id = $DB->insert_record(self::TABLE, $notification);

        return $id;
    }
}
