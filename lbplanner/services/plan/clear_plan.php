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
use local_lbplanner\helpers\plan_helper;

/**
 * Clear the plan for the given user.
 */
class plan_clear_plan extends external_api {
    public static function clear_plan_parameters() {
        return new external_function_parameters(array());
    }

    public static function clear_plan() {
        global $DB, $USER;

        $planid = plan_helper::get_plan_id($USER->id);

        if (!plan_helper::check_edit_permissions($planid, $USER->id)) {
            throw new \Exception('Access denied');
        }

        $DB->delete_records(plan_helper::DEADLINES_TABLE, array('planid' => $planid ));

        return plan_helper::get_plan($planid);
    }

    public static function clear_plan_returns() {
        return plan_helper::plan_structure();
    }
}
