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

/**
 * Update the access of the plan.
 */
class plan_update_access extends external_api {
    public static function update_access_parameters() {
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
            'accesstype' => new external_value(
                PARAM_INT,
                'The access type',
                VALUE_REQUIRED,
                null,
                NULL_NOT_ALLOWED
            ),
            'memberid' => new external_value(
                PARAM_INT,
                'The id of the member',
                VALUE_REQUIRED,
                null,
                NULL_NOT_ALLOWED
            ),
        ));
    }

    public static function update_access($userid, $planid, $accesstype, $memberid) {
        global $DB;

        self::validate_parameters(
            self::update_access_parameters(),
            array('userid' => $userid, 'planid' => $planid, 'accesstype' => $accesstype, 'memberid' => $memberid)
        );

        user_helper::assert_access($userid);

        if (plan_helper::get_owner($planid) != $userid) {
            throw new \moodle_exception('Access denied');
        }

        if ($accesstype < 0 || $accesstype > 2) {
            throw new \moodle_exception('Access type not valid');
        }

        if ($userid == $memberid) {
            throw new \moodle_exception('Cannot change own permissions');
        }

        if (plan_helper::get_owner($planid) == $memberid) {
            throw new \moodle_exception('Cannot change permissions for the plan owner');
        }

        if ($accesstype == plan_helper::ACCESS_TYPE_OWNER) {
            throw new \moodle_exception('Cannot change permissions to owner');
        }

        $access = $DB->get_record(plan_helper::ACCESS_TABLE, array('planid' => $planid, 'userid' => $memberid), '*', MUST_EXIST);
        $access->accesstype = $accesstype;

        $DB->update_record(plan_helper::ACCESS_TABLE, $access);

        return plan_helper::get_plan($planid);
    }

    public static function update_access_returns() {
        return plan_helper::plan_structure();
    }
}
