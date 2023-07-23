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
use local_lbplanner\helpers\slotbooking_helper;
use local_lbplanner\helpers\user_helper;
use local_lbplanner\helpers\slot_helper;

/**
 * Register a new user in the lbplanner app.
 */
class slotbooking_create_slot extends external_api {
    public static function create_slot_parameters() {
        return new external_function_parameters(array(
                'userid' => new external_value(
                        PARAM_INT,
                        'The id of the user which created the slot',
                        VALUE_REQUIRED,
                        null,
                        NULL_NOT_ALLOWED),
                'room' => new external_value(PARAM_TEXT, 'The room the user has selected', VALUE_REQUIRED, null, NULL_NOT_ALLOWED),
                'size' => new external_value(PARAM_INT, 'The theme the user has selected', VALUE_REQUIRED, null, NULL_NOT_ALLOWED),
                'startunit' => new external_value(PARAM_INT, 'The starting Unit', VALUE_REQUIRED, null, NULL_NOT_ALLOWED),
                'endunit' => new external_value(PARAM_INT, 'The ending Unit', VALUE_REQUIRED, null, NULL_NOT_ALLOWED)
        ));
    }

    public static function create_slot($userid, $room, $size, $startunit, $endunit) {
        global $DB;

        self::validate_parameters(
                self::create_slot_parameters(),
                array('userid' => $userid, 'room' => $room , 'size' => $size, 'startunit' => $startunit, 'endunit' => $endunit)
        );

        user_helper::assert_access($userid);

        // Check if the room is already booked in the given time slot.
        if ($DB->record_exists('lbplanner_slots', array('room' => $room , 'startunit' => $startunit, 'endunit' => $endunit))) {
            throw new \moodle_exception('room_already_booked', 'local_lbplanner');
        }
        // Add the slot to the database.
        $slotid = $DB->insert_record(
                slotbooking_helper::SLOT_COURSES_TABLE,
                array('userid' => $userid, 'room' => $room , 'size' => $size, 'startunit' => $startunit, 'endunit' => $endunit)
        );
        return $slotid;
    }

    public static function create_slot_returns() {
        return new external_single_structure(
                array(
                        'slotid' => new external_value(PARAM_INT, 'The id of the slot')
                )
        );
    }
}
