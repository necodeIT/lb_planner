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
use local_lbplanner\helpers\slotbooking_helper;

/**
 * Register a new user in the lbplanner app.
 */
class slotbooking_add_supervisor extends external_api {
    public static function add_supervisor_parameters() {
        return new external_function_parameters(array(
                'userid' => new external_value(
                        PARAM_INT,
                        'The id of the user which adds the slot',
                        VALUE_REQUIRED,
                        null,
                        NULL_NOT_ALLOWED
                ),
                'teacherid' => new external_value(
                        PARAM_INT,
                        'The room the user has selected',
                        VALUE_REQUIRED,
                        null,
                        NULL_NOT_ALLOWED
                ),
                'slotid' => new external_value(
                        PARAM_INT,
                        'The starting Unit',
                        VALUE_REQUIRED,
                        null,
                        NULL_NOT_ALLOWED
                ),
        ));
    }

    public static function add_supervisor($userid, $teacherid, $slotid) {
        global $DB;

        self::validate_parameters(
                self::add_supervisor_parameters(),
                array('userid' => $userid, 'teacherid' => $teacherid, 'slotid' => $slotid)
        );

        user_helper::assert_access($userid);
        if (!slotbooking_helper::slotexits($slotid)) {
            throw new \moodle_exception('slot_not_found', 'local_lbplanner');
        }
        if ($DB->record_exists('lbplanner_supervisors', array('slotid' => $slotid, 'teacherid' => $teacherid))) {
            throw new \moodle_exception('supervisor_already_added', 'local_lbplanner');
        }
        $supervisorid = $DB->insert_record('lbplanner_supervisors', array('slotid' => $slotid, 'teacherid' => $teacherid));
        return $supervisorid;
    }

    public static function add_supervisor_returns() {
        return new external_single_structure(
                array(
                        'supervisorid' => new external_value(PARAM_INT, 'The id of the suporvisor')
                )
        );
    }
}
