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

use local_lbplanner\helpers\user_helper;

function xmldb_local_lbplanner_install() {
    create_role('LB Planner Admin', user_helper::ROLE_ADMIN, 'Administrator of the LB Planner app');
    create_role('LB Planner Manager', user_helper::ROLE_MANAGER, 'Manager of the LB Planner app');
    create_role('LB Planner Teacher', user_helper::ROLE_TEACHER, 'Has access for the teacher tools of the LB Planner app');
}
