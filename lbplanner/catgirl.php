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

namespace local_lbplanner;

use external_api;
use external_function_parameters;
use external_single_structure;
use external_value;

class catgirl extends external_api {
    public static function test_catgirl_parameters() {
        return new external_function_parameters(
            array(
                'name' => new external_value(PARAM_TEXT, 'The name of the catgirl'),
                'age' => new external_value(PARAM_INT, 'The age of the catgirl'),
            )
        );
    }

    public static function test_catgirl($name, $age) {
        global $DB;

        $params = self::validate_parameters(self::test_catgirl_parameters(), array('name' => $name, 'age' => $age));

        $catgirl = new \stdClass();

        return array(
            'name' => $params['name'],
            'age' => $params['age']
        );
    }

    public static function test_catgirl_returns() {
        return new external_single_structure(
            array(
                'name' => new external_value(PARAM_TEXT, 'The name of the catgirl'),
                'age' => new external_value(PARAM_INT, 'The age of the catgirl'),
            )
        );
    }
}
