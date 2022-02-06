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

define('PLAN_ACCESS_OWNER', 0);
define('PLAN_ACCESS_WRITE', 1);
define('PLAN_ACCESS_READ', 2);

class plan_helper {
    public static function table():string {
        return 'local_lbplanner_plans';
    }

    public static function access_table():string {
        return 'local_lbplanner_plan_access';
    }

    public static function get_plan_members(int $planid):array {
        global $DB;
        $members = $DB->get_fieldset_select(self::access_table(), 'userid', array('planid' => $planid));
        return $members;
    }

    public static function get_owner(int $planid):int {
        global $DB;
        $owner = $DB->get_field(self::access_table(), 'userid', array('planid' => $planid, 'accesstype' => PLAN_ACCESS_OWNER));
        return $owner;
    }

    public static function get_plan_id(int $userid):int {
        global $DB;
        $planid = $DB->get_field(self::access_table(), 'planid', array('userid' => $userid));
        return $planid;
    }

    public static function get_access_type(int $planid, int $userid):int {
        global $DB;
        $access = $DB->get_field(self::access_table(), 'accesstype', array('planid' => $planid, 'userid' => $userid));
        return $access;
    }

}
