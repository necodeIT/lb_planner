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
use local_lbplanner\helpers\plan_helper;

/**
 * Delete a deadline from your plan
 */
class plan_delete_deadline extends external_api {
    public static function delete_deadline_parameters() {
        return new external_function_parameters(array(
            'moduleid' => new external_value(
                PARAM_INT,
                'The ID of the Module',
                VALUE_REQUIRED,
                null,
                NULL_NOT_ALLOWED
            ),
        ));
    }

    public static function delete_deadline($moduleid) {
        global $DB, $USER;

        self::validate_parameters(
            self::delete_deadline_parameters(),
            array(
                'moduleid' => $moduleid,
            )
        );

        $planid = plan_helper::get_plan_id($USER->id);

        if (!plan_helper::check_edit_permissions($planid, $USER->id)) {
            throw new \Exception('Access denied');
        }

        $DB->delete_records(
            plan_helper::DEADLINES_TABLE,
            array(
                'planid' => $planid ,
                'moduleid' => $moduleid
            )
        );

        return plan_helper::get_plan($planid);
    }

    public static function delete_deadline_returns() {
        return plan_helper::plan_structure();
    }
}
