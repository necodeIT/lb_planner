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
    public static function set_default_active_year() {
        $currentmonth = idate('m');
        if ($currentmonth >= 8 && $currentmonth <= 12) {
            // Adding the default active year, when the plugin is installed for the first time.
            set_config(
                'defaultactiveyear',
                substr(strval(idate('Y')), 2)
                .'/'.
                substr(strval(idate('Y') + 1), 2),
                'local_lbplanner'
            );
        } else {
            // Adding the default active year, when the plugin is installed for the first time.
            set_config(
                'defaultactiveyear',
                substr(strval(idate('Y') - 1), 2)
                .'/'.
                substr(strval(idate('Y')), 2),
                'local_lbplanner'
            );
        }
    }
}
