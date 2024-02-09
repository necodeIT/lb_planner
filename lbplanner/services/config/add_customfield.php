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
use local_lbplanner\helpers\config_helper;

/**
 * Get version service.
 */
class config_add_customfield extends external_api {
    public static function add_customfield_parameters() {
        return new external_function_parameters(
            array()
        );
    }

    /**
     * Adds a customfield to moodle for each activity where teachers can select GK EK or both.
     * Default value is GK.
     * Requires the following plugin 'modcustomfields'
     * @throws \coding_exception
     * @throws \moodle_exception
     */
    public static function add_customfield() {
        config_helper::add_customfield();
    }

    public static function add_customfield_returns() {
        return null;
    }
}
