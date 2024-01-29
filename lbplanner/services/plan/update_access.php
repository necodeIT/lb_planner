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
use local_lbplanner\helpers\PLAN_ACCESS_TYPE;
use local_lbplanner\helpers\plan_helper;

/**
 * Update the access of the plan.
 *
 * @package local_lbplanner
 * @subpackage services_plan
 * @copyright 2024 necodeIT
 * @license http://www.gnu.org/copyleft/gpl.html GNU GPL v3 or later
 */
class plan_update_access extends external_api {
    public static function update_access_parameters() {
        return new external_function_parameters([
            'accesstype' => new external_value(
                PARAM_INT,
                'New access type',
                VALUE_REQUIRED,
                null,
                NULL_NOT_ALLOWED
            ),
            'memberid' => new external_value(
                PARAM_INT,
                'ID of the member to have their access changed',
                VALUE_REQUIRED,
                null,
                NULL_NOT_ALLOWED
            ),
        ]);
    }

    public static function update_access($accesstype, $memberid) {
        global $DB, $USER;

        self::validate_parameters(
            self::update_access_parameters(),
            ['accesstype' => $accesstype, 'memberid' => $memberid]
        );

        $planid = plan_helper::get_plan_id($USER->id);

        if (plan_helper::get_owner($planid) !== $USER->id) {
            throw new \moodle_exception('Access denied');
        }

        $accesstypeobj = PLAN_ACCESS_TYPE::try_from($accesstype);

        if ($accesstypeobj === null) {
            throw new \moodle_exception('Access type not valid');
        }

        if ($USER->id === $memberid) {
            throw new \moodle_exception('Cannot change own permissions');
        }

        if (plan_helper::get_owner($planid) == $memberid) {
            throw new \moodle_exception('Cannot change permissions for the plan owner');
        }

        if ($accesstypeobj === PLAN_ACCESS_TYPE::OWNER) {
            throw new \moodle_exception('Cannot change permission to owner');
        }

        $access = $DB->get_record(plan_helper::ACCESS_TABLE, ['planid' => $planid, 'userid' => $memberid], '*', MUST_EXIST);
        $access->accesstype = $accesstype;

        $DB->update_record(plan_helper::ACCESS_TABLE, $access);
    }

    public static function update_access_returns() {
        return null;
    }
}
