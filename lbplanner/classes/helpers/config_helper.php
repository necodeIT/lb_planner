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

class config_helper {
    public static function set_default_active_year(): void {
        $currentyear = idate('Y');
        $currentmonth = idate('m');
        if ($currentmonth >= 8) {
            $nextyear = substr(intval($currentyear + 1), -2);
            $defaultyear = substr($currentyear, -2) . '/' . $nextyear;
            // Adding the default active year, when the plugin is installed for the first time.
        } else {
            $previousyear = substr( intval($currentyear - 1), -2);
            $defaultyear = $previousyear . '/' . substr($currentyear, -2);
            // Adding the default active year, when the plugin is installed for the first time.
        }
        set_config(
            'defaultactiveyear',
            $defaultyear,
            'local_lbplanner'
        );
    }
}
