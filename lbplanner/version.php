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

defined('MOODLE_INTERNAL') || die();

$release = '0.0.0';

$plugin->component = 'local_lbplanner';
$plugin->release = 'Alpha v.'.$release;
$plugin->version = 2024022700;
$plugin->dependencies = [
    // Depend upon version 2023110600 of local_modcustomfields.
    'local_modcustomfields' => 2023110600,
];

set_config('release', $release, 'local_lbplanner');
