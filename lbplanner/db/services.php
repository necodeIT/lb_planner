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
    'local_lbplanner_set_catgirl' => array(
        'classname' => 'local_lbplanner\catgirl',
        'methodname' => 'set_catgirl',
        'classpath' => 'local/lbplanner/catgirl.php',
        'description' => 'Create a new catgirl',
        'type' => 'read',
        'ajax' => true,
    ),
    'local_lbplanner_get_catgirl' => array(
        'classname' => 'local_lbplanner\catgirl',
        'methodname' => 'get_catgirl',
        'classpath' => 'local/lbplanner/catgirl.php',
        'description' => 'Get a catgirl with the given id',
        'type' => 'read',
        'ajax' => true,
    ),
    'local_lbplanner_add_catgirl' => array(
        'classname' => 'local_lbplanner\catgirl',
        'methodname' => 'add_catgirl',
        'classpath' => 'local/lbplanner/catgirl.php',
        'description' => 'Modify a catgirl',
        'type' => 'read',
        'ajax' => true,
    ),
);

$services = array(
    'LB Planner API' => array(
        'functions' => array(
            'local_lbplanner_set_catgirl',
            'local_lbplanner_get_catgirl',
            'local_lbplanner_add_catgirl',
        ),
        'restrictedusers' => 0,
        'enabled' => 1,
    ),
);



