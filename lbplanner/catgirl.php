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
    public static function add_catgirl_parameters() {
        return new external_function_parameters(
            array(
                'name' => new external_value(PARAM_TEXT, 'The name of the catgirl'),
                'age' => new external_value(PARAM_INT, 'The age of the catgirl'),
            )
        );
    }

    public static function add_catgirl($name, $age) {
        global $DB;

        $params = self::validate_parameters(self::add_catgirl_parameters(), array('name' => $name, 'age' => $age));

        $catgirl = new \stdClass();
        $catgirl->name = $params['name'];
        $catgirl->age = $params['age'];
        $id = $DB->insert_record('local_lbplanner_catgirls', $catgirl);

        return array(
            'name' => $params['name'],
            'age' => $params['age'],
            'id' => $id
        );
    }

    public static function add_catgirl_returns() {
        return new external_single_structure(
            array(
                'name' => new external_value(PARAM_TEXT, 'The name of the catgirl'),
                'age' => new external_value(PARAM_INT, 'The age of the catgirl'),
                'id' => new external_value(PARAM_INT, 'The id of the catgirl'),
            )
        );
    }

    public static function set_catgirl_parameters() {
        return new external_function_parameters(
            array(
                'id' => new external_value(PARAM_INT, 'The id of the catgirl'),
                'name' => new external_value(PARAM_TEXT, 'The name of the catgirl'),
                'age' => new external_value(PARAM_INT, 'The age of the catgirl'),
            )
        );
    }

    public static function set_catgirl($id, $name, $age) {
        global $DB;

        $params = self::validate_parameters(self::set_catgirl_parameters(), array('id' => $id, 'name' => $name, 'age' => $age));

        $catgirl = new \stdClass();
        $catgirl->id = $params['id'];
        $catgirl->name = $params['name'];
        $catgirl->age = $params['age'];
        $DB->update_record('local_lbplanner_catgirls', $catgirl);

        return array(
            'name' => $params['name'],
            'age' => $params['age'],
            'id' => $params['id']
        );
    }

    public static function set_catgirl_returns() {
        return new external_single_structure(
            array(
                'name' => new external_value(PARAM_TEXT, 'The name of the catgirl'),
                'age' => new external_value(PARAM_INT, 'The age of the catgirl'),
                'id' => new external_value(PARAM_INT, 'The id of the catgirl'),
            )
        );
    }

    public static function get_catgirl_parameters() {
        return new external_function_parameters(
            array(
                'id' => new external_value(PARAM_INT, 'The id of the catgirl'),
            )
        );
    }

    public static function get_catgirl($id) {
        global $DB;

        $params = self::validate_parameters(self::get_catgirl_parameters(), array('id' => $id));

        $catgirl = $DB->get_record('local_lbplanner_catgirls', array('id' => $params['id']));

        return $catgirl;
    }

    public static function get_catgirl_returns() {
        return new external_single_structure(
        array(
            'name' => new external_value(PARAM_TEXT, 'The name of the catgirl'),
            'age' => new external_value(PARAM_INT, 'The age of the catgirl'),
            'id' => new external_value(PARAM_INT, 'The id of the catgirl'),
        )
        );
    }

}
