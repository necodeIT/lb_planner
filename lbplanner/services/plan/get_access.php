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
use local_lbplanner\helpers\plan_helper;
use local_lbplanner\helpers\user_helper;

/**
 * Get the access type to the plan.
 */
class plan_get_access extends external_api {
    public static function get_access_parameters() {
        return new external_function_parameters(array(
            'userid' => new external_value(
                PARAM_INT,
                'The id of the user to get the data for',
                VALUE_REQUIRED,
                null,
                NULL_NOT_ALLOWED
            ),
            'planid' => new external_value(
                PARAM_INT,
                'The id of the plan',
                VALUE_REQUIRED,
                null,
                NULL_NOT_ALLOWED
            ),
        ));
    }

    public static function get_access($userid, $planid) {
        self::validate_parameters(self::get_access_parameters(), array('userid' => $userid, 'planid' => $planid));

        user_helper::assert_access($userid);

        return array(
            'accesstype' => plan_helper::get_access_type($userid, $planid),
            'planid' => $planid,
            'userid' => $userid,
        );
    }

    public static function get_access_returns() {
        return new external_single_structure(
            array(
                'accesstype' => new external_value(PARAM_INT, 'The type of access the user has to the plan'),
                'planid' => new external_value(PARAM_INT, 'The id of the plan'),
                'userid' => new external_value(PARAM_INT, 'The id of the plan'),
            )
        );
    }
}
