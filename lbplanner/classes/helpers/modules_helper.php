<?php
// This file is part of the local_lbplanner.
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

namespace local_lbplanner\helpers;

use block_accessreview\external\get_module_data;
use external_function_parameters;
use external_single_structure;
use external_value;
use moodle_url;

/**
 * Contains helper functions for working with modules.
 */
class modules_helper {

    /**
     * Table where modules are stored.
     */
    const ASSIGN_TABLE = 'assign';

    /**
     * Table where max. and min. grades of the modules are stored.
     */
    const GRADE_ITEMS_TABLE = 'grade_items';

    /**
     * Table where course modules are stored.
     */
    const COURSE_MODULES_TABLE = 'course_modules';

    /**
     * Table where grades of the modules are stored.
     */
    const GRADES_TABLE = 'assign_grades';

    /**
     * Table where grading scales are stored.
     */
    const SCALE_TABLE = 'scale';

    /**
     * Table where submissions of the modules are stored.
     */
    const SUBMISSIONS_TABLE = 'assign_submission';

    /**
     * Submitted status name of a submission.
     */
    const SUBMISSION_STATUS_SUBMITTED = 'submitted';

    /**
     * Enum value for grade 'Nicht erfüllt'.
     */
    const GRADE_RIP = 4;

    /**
     * Enum value for grade 'GK überwiegend'.
     */
    const GRADE_GK = 3;

    /**
     * Enum value for grade 'GK vollständig'.
     */
    const GRADE_GKV = 2;


    /**
     * Enum value for grade 'EK überwiegend'.
     */
    const GRADE_EK = 1;

    /**
     * Enum value for grade 'EK vollständig'.
     */
    const GRADE_EKV = 0;

    /**
     * Enum value for completed module.
     */
    const STATUS_DONE = 0;

    /**
     * Enum value for uploaded module.
     */
    const STATUS_UPLOADED = 1;

    /**
     * Enum value for not completed module.
     */
    const STATUS_LATE = 2;

    /**
     * Enum value for pending module.
     */
    const STATUS_PENDING = 3;

    /**
     * Enum value for modules of type 'GK'.
     */
    const TYPE_GK = 0;

    /**
     * Enum value for modules of type 'EK'.
     */
    const TYPE_EK = 1;

    /**
     * Enum value for modules of type 'TEST'.
     */
    const TYPE_TEST = 2;

    /**
     * Enum value for modules of type 'M'.
     */
    const TYPE_M = 3;

    /**
     * Enum value for non
     */
    const TYPE_NONE = 4;

    /**
     * The return structure of a module.
     *
     * @return external_single_structure The structure of a module.
     */
    public static function structure() : external_single_structure {
        return new external_single_structure(
        array(
            'moduleid' => new external_value(PARAM_INT, 'The id of the module'),
            'name' => new external_value(PARAM_TEXT, 'The name of the module'),
            'courseid' => new external_value(PARAM_INT, 'The id of the course'),
            'status' => new external_value(PARAM_INT, 'The status of the module'),
            'type' => new external_value(PARAM_INT, 'The type of the module'),
            'url' => new external_value(PARAM_TEXT, 'The url of the module in moodle'),
            'grade' => new external_value(PARAM_INT, 'The grade of the module'),
            'deadline' => new external_value(PARAM_INT, 'The deadline of the module set by the teacher'),
        )
        );
    }

    /**
     * Determins the enum value for a grade.
     *
     * @param integer $grade The grade of the module.
     * @param integer $maxgrade The max. grade of the module.
     * @param integer $mingrade The min. grade of the module.
     * @param integer $gradepass The grade to pass the module.
     * @return integer The enum value for the grade.
     */
    public static function determin_uinified_grade(int $grade, int $maxgrade, int $mingrade, int $gradepass) : int {
        if ($grade < $gradepass) {
            return self::GRADE_RIP;
        }

        $maxgrade = $maxgrade - $mingrade;

        $p = $grade / $maxgrade;

        if ($p >= 0.9) {
            return self::GRADE_EKV;
        } else if ($p >= 0.8) {
            return self::GRADE_EK;
        } else if ($p >= 0.7) {
            return self::GRADE_GKV;
        } else if ($p >= 0.4) {
            return self::GRADE_GK;
        } else {
            return self::GRADE_RIP;
        }
    }

    /**
     * Maps the given info to a module status.
     *
     * @param boolean $submitted Whether the module is submitted.
     * @param boolean $done Whether the module is completed.
     * @param boolean $late Whether the module is late.
     * @return integer The enum value for the module status.
     */
    public static function map_status(bool $submitted, bool $done, bool $late) : int {
        if ($done) {
            return self::STATUS_DONE;
        } else if ($submitted) {
            return self::STATUS_UPLOADED;
        } else if ($late) {
            return self::STATUS_LATE;
        } else {
            return self::STATUS_PENDING;
        }
    }

    /**
     * Maps the given name to a module type.
     *
     * @param string $modulename The name of the module.
     * @return integer The enum value for the module type.
     */
    public static function determin_type(string $modulename) : int {
        // Convert module name to uppercase.
        $modulename = strtoupper($modulename);

        // Return TYPE_TEST if the name contains 'test' or 'sa'.
        if (strpos($modulename, '[TEST]') !== false || strpos($modulename, '[SA]') !== false) {
            return self::TYPE_TEST;
        }
        // Return TYPE_GK if the name contains 'GK'.

        if (strpos($modulename, '[GK]') !== false) {
            return self::TYPE_GK;
        }

        if (strpos($modulename, '[EK]') !== false) {
            return self::TYPE_EK;
        }

        // Return TYPE_EK if the name contains 'M'.
        if (strpos($modulename, '[M]') !== false) {
            return self::TYPE_M;
        }

        // Return TYPE_NONE elswise.
        return self::TYPE_NONE;
    }

    /**
     * Returns the url of the module.
     *
     * @param integer $moduleid The id of the module.
     * @param integer $courseid The id of the course.
     * @return string The url of the module.
     */
    public static function get_module_url(int $moduleid, int $courseid) : string {
        global $DB;

        $view = $DB->get_record(
            self::COURSE_MODULES_TABLE,
            array('course' => $courseid, 'instance' => $moduleid, 'module' => 1)
        );

        return strval(new moodle_url('/mod/assign/view.php?id='.$view->id));
    }

    /**
     * Retrieves a module of the given id for the given user.
     *
     * @param integer $moduleid The id of the module.
     * @param integer $userid The id of the user.
     * @return array The module.
     */
    public static function get_module(int $moduleid, int $userid) : array {
        global $DB;
        date_default_timezone_set('UTC');

        // Get module data.
        $module = $DB->get_record(self::ASSIGN_TABLE, array('id' => $moduleid));

        // Determine module type.
        $type = self::determin_type($module->name);

        if ($type == self::TYPE_NONE) {
            return array();
        }
        // Check if there are any submissions or feedbacks for this module.

        $submitted = false;

        if ($DB->record_exists(self::SUBMISSIONS_TABLE, array('assignment' => $moduleid, 'userid' => $userid))) {
            $submission = $DB->get_record(
                self::SUBMISSIONS_TABLE,
                array('assignment' => $moduleid, 'userid' => $userid)
            );

            $submitted = strval($submission->status) == self::SUBMISSION_STATUS_SUBMITTED;
        }

        $done = false;
        $grade = null;

        if ($DB->record_exists(self::GRADES_TABLE, array('assignment' => $moduleid, 'userid' => $userid))) {
            $moduleboundaries = $DB->get_record(self::GRADE_ITEMS_TABLE, array('iteminstance' => $moduleid));

            $mdlgrades = $DB->get_records(
                self::GRADES_TABLE,
                array('assignment' => $moduleid, 'userid' => $userid)
            );

            $mdlgrade = end($mdlgrades);

            if ($mdlgrade->grade > 0) {
                $done = true;

                $grade  = self::determin_uinified_grade(
                $mdlgrade->grade, $moduleboundaries->grademax,
                $moduleboundaries->grademin,
                $moduleboundaries->gradepass
                );

                $done = $grade != self::GRADE_RIP;
            }
        }
        // Check if the module is late.

        $late = false;
        $planid = plan_helper::get_plan_id($userid);

        if ($DB->record_exists(plan_helper::DEADLINES_TABLE, array('planid' => $planid, 'moduleid' => $moduleid))) {
            $deadline = $DB->get_record(plan_helper::DEADLINES_TABLE, array('planid' => $planid, 'moduleid' => $moduleid));
            $late = intval(date("Ymd", $deadline->deadlineend)) < intval(date("Ymd")) && !$done;
        }

        $status = self::map_status($submitted, $done, $late);

        // Return the appropriate data.

        return array(
            'moduleid' => $moduleid,
            'name' => $module->name,
            'courseid' => $module->course,
            'status' => $status,
            'type' => $type,
            'url' => self::get_module_url($moduleid, $module->course),
            'grade' => $grade,
            'deadline' => $module->duedate > 0 ? $module->duedate : null,
        );
    }

    /**
     * Reteruns all modules for the given course id.
     *
     * @param integer $courseid The id of the course.
     * @param integer $userid The id of the user.
     * @return array The modules.
     */
    public static function get_all_course_modules(int $courseid, int $userid, bool $ekenabled) : array {
        global $DB;

        $mdlmodules = $DB->get_records(self::ASSIGN_TABLE, array('course' => $courseid));

        $modules = array();

        foreach ($mdlmodules as $mdlmodule) {
            if (!$ekenabled && self::determin_type($mdlmodule->name) == self::TYPE_EK) {
                continue;
            }
            $module = self::get_module($mdlmodule->id, $userid);
            if ($module != null) {
                $modules[] = $module;
            }
        }

        return $modules;
    }
}
