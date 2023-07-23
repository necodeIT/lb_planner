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

class slotbooking_helper {
    /**
     * Name of the Slots Table
     */
    const SLOTS_TABLE = 'local_lbplanner_slots';
    /**
     * Name of the Reservations Table
     */
    const RESERVATIONS_TABLE = 'local_lbplanner_reservations';
    /**
     * Name of the Courses Table
     */
    const SLOT_COURSES_TABLE = 'local_lbplanner_slot_courses';
    /**
     * Name of the Substitution Table
     */
    const SUBST_TABLE = 'local_lbplanner_subst';
    /**
     * Name of the Supervisor Table
     */
    const SUPERVI_TABLE = 'local_lbplanner_supervi';

    public static function get_slot($slotid) {
        global $DB;
        if (self::slotexits($slotid)) {
            $slot = $DB->get_record(self::SLOTS_TABLE, array('id' => $slotid));
            return $slot;
        } else {
            return -1;
        }
    }
    public static function slotexits($slotid) {
        global $DB;
        if ($DB->record_exists(self::SLOTS_TABLE, array('id' => $slotid))) {
            return true;
        } else {
            return false;
        }
    }
}
