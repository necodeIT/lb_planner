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
use external_single_structure;
use external_value;

/**
 * Get version service.
 */
class config_get_version extends external_api {
    public static function get_version_parameters() {
        return new external_function_parameters(
            array()
        );
    }

    public static function get_version() {
        $release = get_config('local_lbplanner', 'release');
        return array(
            'release' => get_config('local_lbplanner', 'release'));
    }

    public static function get_version_returns() {
        return new external_single_structure(
            array(
                'release' => new external_value(PARAM_TEXT, 'the current LBPlanner version'),
            )
        );
    }
}
