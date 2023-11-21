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

use core\context\user;
use external_api;
use external_function_parameters;
use external_value;
use local_lbplanner\helpers\modules_helper;
use context_module;
use course_modinfo;

/**
 * Get the data for a module.
 */
class modules_get_module extends external_api {
    public static function get_module_parameters() {
        return new external_function_parameters([
            'moduleid' => new external_value(PARAM_INT, 'The id of the module', VALUE_REQUIRED, null, NULL_NOT_ALLOWED),
        ]);
    }

    public static function get_module($moduleid) {
        global $DB, $USER, $CFG;
        require_once($CFG->dirroot . '/mod/assign/lib.php');

        self::validate_parameters(self::get_module_parameters(), ['moduleid' => $moduleid]);
        var_dump(assign_get_coursemodule_info($moduleid));

        /*if (!$DB->record_exists(modules_helper::MDL_ASSIGN_TABLE, array('id' => $moduleid))) {
            throw new \moodle_exception('Module not found');
        }*/

        return null;
    }

    public static function get_module_returns() {
        return modules_helper::structure();
    }
}
