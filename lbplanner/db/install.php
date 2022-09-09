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
use local_lbplanner\helpers\config_helper;

defined('MOODLE_INTERNAL') || die;

function xmldb_local_lbplanner_install() {
    global $DB;

    $admins = array();
    $managers = array();
    $teachers = array();

    // Get all users with admin role and delete the role.
    if ($DB->record_exists('role', array('shortname' => user_helper::ROLE_ADMIN))) {
        $adminid = $DB->get_field('role', 'id', array('shortname' => user_helper::ROLE_ADMIN));
        $admins = $DB->get_records('role_assignments', array('roleid' => $adminid));

        $DB->delete_records('role', array('shortname' => user_helper::ROLE_ADMIN, 'id' => $adminid));
        $DB->delete_records('role_assignments', array('roleid' => $adminid));
    }

    // Get all users with manager role and delete the role.
    if ($DB->record_exists('role', array('shortname' => user_helper::ROLE_MANAGER))) {
        $managerid = $DB->get_field('role', 'id', array('shortname' => user_helper::ROLE_MANAGER));
        $managers = $DB->get_records('role_assignments', array('roleid' => $managerid));

        $DB->delete_records('role', array('shortname' => user_helper::ROLE_MANAGER, 'id' => $managerid));
        $DB->delete_records('role_assignments', array('roleid' => $managerid));
    }

    // Get all users with teacher role and delete the role.
    if ($DB->record_exists('role', array('shortname' => user_helper::ROLE_TEACHER))) {
        $teacherid = $DB->get_field('role', 'id', array('shortname' => user_helper::ROLE_TEACHER));
        $teachers = $DB->get_records('role_assignments', array('roleid' => $teacherid));

        $DB->delete_records('role', array('shortname' => user_helper::ROLE_TEACHER, 'id' => $teacherid));
        $DB->delete_records('role_assignments', array('roleid' => $teacherid));
    }

    // Create all roles.
    $adminid = create_role('LB Planner Admin', user_helper::ROLE_ADMIN, 'Administrator access to the LB Planner app');
    $managerid = create_role('LB Planner Manager', user_helper::ROLE_MANAGER, 'Manager access to the LB Planner app');
    $teacherid = create_role('LB Planner Teacher', user_helper::ROLE_TEACHER, 'Teacher access to the LB Planner app');

    set_role_contextlevels($adminid, array(CONTEXT_SYSTEM));
    set_role_contextlevels($managerid, array(CONTEXT_SYSTEM));
    set_role_contextlevels($teacherid, array(CONTEXT_SYSTEM));

    // Reassign all users with admin role.
    foreach ($admins as $admin) {
        role_assign($adminid, $admin->userid, $admin->contextid);
    }

    // Reassign all users with manager role.
    foreach ($managers as $manager) {
        role_assign($managerid, $manager->userid, $manager->contextid);
    }

    // Reassign all users with teacher role.
    foreach ($teachers as $teacher) {
        role_assign($teacherid, $teacher->userid, $teacher->contextid);
    }
}
config_helper::set_default_active_year();

