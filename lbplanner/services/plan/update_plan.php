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
 * Update the plan of the given user.
 *
 * @package local_lbplanner
 * @subpackage services_plan
 * @copyright 2024 necodeIT
 * @license http://www.gnu.org/copyleft/gpl.html GNU GPL v3 or later
 */
class plan_update_plan extends external_api {
    public static function update_plan_parameters() {
        return new external_function_parameters([
            'planname' => new external_value(
                PARAM_TEXT,
                'Name of the Plan',
                VALUE_REQUIRED,
                null,
                NULL_NOT_ALLOWED
            ),
            'enableek' => new external_value(
                PARAM_BOOL,
                'Whether EK is enabled for the plan',
                VALUE_REQUIRED,
                null,
                NULL_NOT_ALLOWED
            ),
        ]);
    }

    public static function update_plan($planname, $enableek) {
        global $DB, $USER;

        self::validate_parameters(
            self::update_plan_parameters(),
            ['planname' => $planname, 'enableek' => $enableek]
        );

        $planid = plan_helper::get_plan_id($USER->id);

        if (!plan_helper::check_edit_permissions($planid, $USER->id)) {
            throw new \Exception('Access denied');
        }

        $plan = $DB->get_record(plan_helper::TABLE, ['id' => $planid], '*', MUST_EXIST);
        $plan->name = $planname;
        $plan->enableek = $enableek;

        $DB->update_record(plan_helper::TABLE, $plan);
    }

    public static function update_plan_returns() {
        return null;
    }
}
