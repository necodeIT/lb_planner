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
use local_lbplanner\helpers\notifications_helper;

/**
 * Get all the notifications of the given user.
 */
class notifications_get_all_notifications extends external_api {
    public static function get_all_notifications_parameters() {
        return new external_function_parameters([]);
    }

    public static function get_all_notifications() {
        global $DB, $USER;

        $dbnotifications = $DB->get_records(notifications_helper::TABLE, ['userid' => $USER->id]);

        $notifications = [];

        foreach ($dbnotifications as $dbnotification) {
            $notifications[] = [
                'status' => $dbnotification->status,
                'type' => $dbnotification->type,
                'info' => $dbnotification->info,
                'userid' => $dbnotification->userid,
                'notificationid' => $dbnotification->id,
                'timestamp' => $dbnotification->timestamp,
                'timestamp_read' => $dbnotification->timestamp_read,
            ];
        }
        return $notifications;
    }

    public static function get_all_notifications_returns() {
        return new external_multiple_structure(
            notifications_helper::structure()
        );
    }
}
