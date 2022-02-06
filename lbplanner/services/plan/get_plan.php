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
use local_lbplanner\helpers\plan_helper;
use local_lbplanner\helpers\user_helper;

class plan_get_plan extends external_api {
    public static function get_plan_parameters() {
        return new external_function_parameters(array(
            'userid' => new external_value(
                PARAM_INT,
                'The id of the user',
                VALUE_REQUIRED,
                null,
                NULL_NOT_ALLOWED
            ),
        ));
    }

    public static function get_plan($userid) {
        global $DB;

        self::validate_parameters(self::get_plan_parameters(), array('userid' => $userid));

        if (!user_helper::check_access($userid)) {
            throw new \Exception('Access denied');
        }

        $planid = plan_helper::get_plan_id($userid);

        $plan = $DB->get_record(plan_helper::TABLE, array('id' => $planid));

        $dbdeadlines = $DB->get_records(plan_helper::DEADLINES_TABLE, array('planid' => $planid), '*', MUST_EXIST);

        $deadlines = array();

        foreach ($dbdeadlines as $dbdeadline) {
            $deadlines[] = array(
                'planid' => $dbdeadline->planid,
                'startdate' => $dbdeadline->startdate,
                'enddate' => $dbdeadline->enddate,
                'moduleid' => $dbdeadline->moduleid,
            );
        }

        return array(
            'name' => $plan->name,
            'planid' => $planid,
            'enableek' => $plan->enableek,
            'deadlines' => $deadlines,
        );
    }

    public static function get_plan_returns() {
        return new external_single_structure(
            array(
                'name' => new external_value(PARAM_TEXT, 'The name of the plan'),
                'planid' => new external_value(PARAM_INT, 'The id of the plan'),
                'enableek' => new external_value(PARAM_BOOL, 'If the plan is enabled for ek'),
                'deadlines' => new external_multiple_structure(
                    new external_single_structure(
                        array(
                            'planid' => new external_value(PARAM_INT, 'The id of the plan'),
                            'moduleid' => new external_value(PARAM_INT, 'The id of the module'),
                            'deadlinestart' => new external_value(PARAM_INT, 'The start of the deadline'),
                            'deadlineend' => new external_value(PARAM_INT, 'The end of the deadline')
                        )
                    )
                )
            )
        );
    }
}
