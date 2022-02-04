<?php
// This file is part of the LB Planner plugin.
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

namespace local_lbplanner_user;

use external_api;
use external_function_parameters;
use external_single_structure;
use external_value;

class user_get_user_info extends external_api {
    public static function function_name_parameters() {
        return new external_function_parameters(array(
            'userid' => new external_value(PARAM_INT, 'The user id'),
        ));
    }

    public static function get_user_info($userid) {
        global $DB;

        $params = self::validate_parameters(self::function_name_parameters(), array('userid' => $userid));

        $user = $DB->get_record('user', array('id' => $params['userid']));

        return array();
    }

    public static function function_name_returns() {
        return new external_single_structure(
            array(returns)
        );
    }
}
