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
use local_lbplanner\helpers\user_helper;

class plan_leave_plan extends external_api {
    public static function leave_plan_parameters() {
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

    public static function leave_plan($userid, $planid) {
        global $DB;

        self::validate_parameters(self::leave_plan_parameters(), array('userid' => $userid, 'planid' => $planid));

        if (!user_helper::check_access($userid)) {
            throw new \moodle_exception('Access denied');
        }
        if (plan_helper::get_access_type($userid, $planid) == plan_helper::ACCESS_TYPE_OWNER) {
            throw new \moodle_exception('Owner cannot leave his plan');
        }

        if (plan_helper::get_access_type($userid, $planid) == plan_helper::ACCESS_TYPE_NONE) {
            throw new \moodle_exception('User is not a member of this plan');
        }

        $newplanid = plan_helper::copy_plan($planid, $userid);

        $oldaccess = $DB->get_record(
            plan_helper::ACCESS_TABLE,
            array('planid' => $planid, 'userid' => $userid), '*', MUST_EXIST
        );

        $oldaccess->planid = $newplanid;
        $oldaccess->accesstype = plan_helper::ACCESS_TYPE_OWNER;

        $DB->update_record(plan_helper::ACCESS_TABLE, $oldaccess);



        return plan_helper::get_plan($planid, $userid);
    }
    public static function leave_plan_returns() {
        return plan_helper::plan_structure();
    }
}
