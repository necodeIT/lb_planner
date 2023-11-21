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
 * Add a deadline to the plan.
 */
class plan_add_deadline extends external_api {
    public static function add_deadline_parameters() {
        return new external_function_parameters([
            'moduleid' => new external_value(
                PARAM_INT,
                'The ID of the Module',
                VALUE_REQUIRED,
                null,
                NULL_NOT_ALLOWED
            ),
            'deadlinestart' => new external_value(
                PARAM_INT,
                'The Start of the Module',
                VALUE_REQUIRED,
                null,
                NULL_NOT_ALLOWED
            ),
            'deadlineend' => new external_value(
                PARAM_INT,
                'The End of the Module',
                VALUE_REQUIRED,
                null,
                NULL_NOT_ALLOWED
            ),
        ]);
    }

    public static function add_deadline($moduleid, $deadlinestart, $deadlineend) {
        global $DB, $USER;

        self::validate_parameters(
            self::add_deadline_parameters(),
            [
                'moduleid' => $moduleid,
                'deadlinestart' => $deadlinestart,
                'deadlineend' => $deadlineend,
            ]
        );

        $planid = plan_helper::get_plan_id($USER->id);

        if ( !plan_helper::check_edit_permissions( $planid, $USER->id ) ) {
            throw new \moodle_exception('Access denied');
        }

        if ($DB->record_exists(plan_helper::DEADLINES_TABLE, ['moduleid' => $moduleid, 'planid' => $planid])) {
            throw new \moodle_exception('Deadline already exists');
        }

        $deadline = new \stdClass();

        $deadline->planid = $planid;
        $deadline->moduleid = $moduleid;
        $deadline->deadlinestart = $deadlinestart;
        $deadline->deadlineend = $deadlineend;

        return $DB->insert_record(plan_helper::DEADLINES_TABLE, $deadline);
    }

    public static function add_deadline_returns() {
        return new external_value(PARAM_INT,"The ID of the newly added deadline");
    }
}
