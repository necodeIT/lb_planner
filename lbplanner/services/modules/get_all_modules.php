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
use external_single_structure;
use external_value;

/**
 * Get all the modules of the current year.
 */
class modules_get_all_modules extends external_api {
    public static function get_all_modules_parameters() {
        return new external_function_parameters(array(
            'userid' => new external_value(PARAM_INT, 'The id of the user', VALUE_REQUIRED, null, NULL_NOT_ALLOWED),
        ));
    }

    public static function get_all_modules($userid) {
        global $DB;
        global $USER;

        $params = self::validate_parameters(self::get_all_modules_parameters(), array('userid' => $userid));

        // TODO: Check if token is allowed to access this function.
        // TODO: Get all moduels of the current year.

        return array();
    }

    public static function get_all_modules_returns() {
        return new external_multiple_structure(
            new external_single_structure(
                array(
                    'moduleid' => new external_value(PARAM_INT, 'The id of the module'),
                    'name' => new external_value(PARAM_TEXT, 'The name of the module'),
                    'courseid' => new external_value(PARAM_INT, 'The id of the course'),
                    'status' => new external_value(PARAM_INT, 'The status of the module'),
                    'type' => new external_value(PARAM_INT, 'The type of the module'),
                    'url' => new external_value(PARAM_TEXT, 'The url of the module in moodle'),
                    'deadline' => new external_value(PARAM_INT, 'The deadline of the module set by the teacher'),
                )
            )
        );
    }
}
