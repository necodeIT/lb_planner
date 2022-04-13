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
use local_lbplanner\helpers\modules_helper;
use local_lbplanner\helpers\plan_helper;
use local_lbplanner\helpers\user_helper;

/**
 * Get the data for a module.
 */
class modules_get_module extends external_api {
    public static function get_module_parameters() {
        return new external_function_parameters(array(
            'moduleid' => new external_value(PARAM_INT, 'The id of the module', VALUE_REQUIRED, null, NULL_NOT_ALLOWED),
            'userid' => new external_value(PARAM_INT, 'The id of the user', VALUE_REQUIRED, null, NULL_NOT_ALLOWED),
        ));
    }

    public static function get_module($moduleid, $userid) {
        global $DB;

        self::validate_parameters(self::get_module_parameters(), array('moduleid' => $moduleid, 'userid' => $userid));

        user_helper::assert_access($userid);

        if (!$DB->record_exists(modules_helper::ASSIGN_TABLE, array('id' => $moduleid))) {
            throw new \moodle_exception('Module not found');
        }

        // Todo: get module data.
        $module = $DB->get_record(modules_helper::ASSIGN_TABLE, array('id' => $moduleid));

        // Todo: check if there are any submissions or feedbacks for this module.

        $submitted = false;

        if ($DB->record_exists(modules_helper::SUBMISSIONS_TABLE, array('assignment' => $moduleid, 'userid' => $userid))) {
            $submission = $DB->get_record(
                modules_helper::SUBMISSIONS_TABLE,
                array('assignment' => $moduleid, 'userid' => $userid)
            );

            $submitted = strval($submission->status) == modules_helper::SUBMISSION_STATUS_SUBMITTED;
        }

        $done = false;
        $grade = null;

        if ($DB->record_exists(modules_helper::GRADES_TABLE, array('assignment' => $moduleid, 'userid' => $userid))) {
            $moduleboundaries = $DB->get_record(modules_helper::GRADE_ITEMS_TABLE, array('iteminstance' => $moduleid));

            $mdlgrades = $DB->get_records(
                modules_helper::GRADES_TABLE,
                array('assignment' => $moduleid, 'userid' => $userid)
            );

            $mdlgrade = end($mdlgrades);

            if ($mdlgrade->grade > 0) {
                $done = true;

                $grade  = modules_helper::determin_uinified_grade(
                $mdlgrade->grade, $moduleboundaries->grademax,
                $moduleboundaries->grademin,
                $moduleboundaries->gradepass
                );

                $done = $grade != modules_helper::GRADE_RIP;
            }
        }

        $late = false;
        $planid = plan_helper::get_plan_id($userid);

        if ($DB->record_exists(plan_helper::DEADLINES_TABLE, array('planid' => $planid, 'moduleid' => $moduleid))) {
            $deadline = $DB->get_record(plan_helper::DEADLINES_TABLE, array('planid' => $planid, 'moduleid' => $moduleid));
            $late = $deadline->deadlineend < time() && !$done;
        }

        $status = modules_helper::map_status($submitted, $done, $late);

        // Todo: return the appropriate data.

        return    array(
            'moduleid' => $moduleid,
            'name' => $module->name,
            'courseid' => $module->course,
            'status' => $status,
            'type' => modules_helper::determin_type($module->name),
            'url' => modules_helper::get_module_url($moduleid, $module->course),
            'grade' => $grade,
            'deadline' => $module->duedate,
        );
    }

    public static function get_module_returns() {
        return modules_helper::structure();
    }
}
