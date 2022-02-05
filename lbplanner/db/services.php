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


defined('MOODLE_INTERNAL') or die();

$functions = array(
    'local_lbplanner_services_user_get_user' => array(
        'classname' => 'local_lbplanner_services\user_get_user',
        'methodname' => 'get_user',
        'classpath' => 'local/lbplanner/services/user/get_user.php',
        'description' => 'Get the data for a user',
        'type' => 'read',
        'capabilities' => '',
        'ajax' => true,
    ),
    'local_lbplanner_services_user_register_user' => array(
        'classname' => 'local_lbplanner_services\user_register_user',
        'methodname' => 'register_user',
        'classpath' => 'local/lbplanner/services/user/register_user.php',
        'description' => 'Register a new user',
        'type' => 'write',
        'capabilities' => '',
        'ajax' => true,
    ),
    'local_lbplanner_services_user_update_user' => array(
        'classname' => 'local_lbplanner_services\user_update_user',
        'methodname' => 'update_user',
        'classpath' => 'local/lbplanner/services/user/update_user.php',
        'description' => 'Update the data for a user',
        'type' => 'write',
        'capabilities' => '',
        'ajax' => true,
    ),
    'local_lbplanner_services_user_delete_user' => array(
        'classname' => 'local_lbplanner_services\user_delete_user',
        'methodname' => 'delete_user',
        'classpath' => 'local/lbplanner/services/user/delete_user.php',
        'description' => 'Delete a user',
        'type' => 'write',
        'capabilities' => '',
        'ajax' => true,
    ),
    'local_lbplanner_services_user_refresh_permissions' => array(
        'classname' => 'local_lbplanner_services\user_refresh_permissions',
        'methodname' => 'refresh_permissions',
        'classpath' => 'local/lbplanner/services/user/refresh_permissions.php',
        'description' => 'Recheck the permissions for a user',
        'type' => 'write',
        'capabilities' => '',
        'ajax' => true,
    ),
);

$services = array(
    'LB Planner API' => array(
        'functions' => array(
            'local_lbplanner_services_user_get_user',
            'local_lbplanner_services_user_register_user',
            'local_lbplanner_services_user_update_user',
            'local_lbplanner_services_user_delete_user',
            'local_lbplanner_services_user_refresh_permissions',
        ),
        'restrictedusers' => 0,
        'enabled' => 1,
    ),
);
