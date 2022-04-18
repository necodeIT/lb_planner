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
use local_lbplanner\helpers\user_helper;
use local_lbplanner\helpers\feedback_helper;

/**
 * Add feedback to the database.
 */
class feedback_submit_feedback extends external_api {
    public static function submit_feedback_parameters() {
        return new external_function_parameters(array(
            'content' => new external_value(PARAM_TEXT, 'The id of the course', VALUE_REQUIRED, null, NULL_NOT_ALLOWED),
            'userid' => new external_value(PARAM_INT, 'The id of the user', VALUE_REQUIRED, null, NULL_NOT_ALLOWED),
            'type' => new external_value(PARAM_INT, 'The id of the user', VALUE_REQUIRED, null, NULL_NOT_ALLOWED),
            'logs' => new external_value(PARAM_TEXT, 'The id of the user', VALUE_REQUIRED, null, NULL_NOT_ALLOWED),
        ));
    }

    public static function submit_feedback($content, $userid, $type, $logs) {
        global $DB;

        self::validate_parameters(
            self::submit_feedback_parameters(),
            array('content' => $content, 'userid' => $userid, 'type' => $type, 'logs' => $logs)
        );

        user_helper::assert_access($userid);

        $id = $DB->insert_record(feedback_helper::LBPLANNER_FEEDBACK_TABLE, array(
            'content' => $content,
            'userid' => $userid,
            'type' => $type,
            'status' => feedback_helper::STATUS_UNREAD,
            'timestamp' => time(),
            'logs' => $logs,
        ));

        return feedback_helper::get_feedback($id);
    }

    public static function submit_feedback_returns() {
        return feedback_helper::structure();
    }
}
