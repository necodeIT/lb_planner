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

class plan_helper {
    const ACCESS_TYPE_OWNER = 0;
    const ACCESS_TYPE_WRITE = 1;
    const ACCESS_TYPE_READ = 2;
    const ACCESS_TYPE_NONE = -1;

    const EK_DISABLED = 0;
    const EK_ENABLED = 1;

    const INVITE_PENDING = 0;
    const INVITE_ACCEPTED = 1;
    const INVITE_DECLINED = 2;

    const TABLE = 'local_lbplanner_plans';
    const ACCESS_TABLE = 'local_lbplanner_plan_access';
    const DEADLINES_TABLE = 'local_lbplanner_deadlines';
    const INVITES_TABLE = 'local_lbplanner_plan_invites';

    public static function get_plan_members(int $planid):array {
        global $DB;
        $members = $DB->get_fieldset_select(self::TABLE, 'userid', array('planid' => $planid));
        return $members;
    }

    public static function get_owner(int $planid):int {
        global $DB;

        $owner = $DB->get_field(
            self::ACCESS_TABLE,
            'userid', array('planid' => $planid, 'accesstype' => self::ACCESS_TYPE_OWNER)
        );

        return $owner;
    }

    public static function get_plan_id(int $userid):int {
        global $DB;
        $planid = $DB->get_field(self::ACCESS_TABLE, 'planid', array('userid' => $userid));
        return $planid;
    }

    public static function get_access_type(int $planid, int $userid):int {
        global $DB;

        if ($DB->record_exists(self::ACCESS_TABLE, array('planid' => $planid, 'userid' => $userid))) {
            return $DB->get_field(self::ACCESS_TABLE, 'accesstype', array('planid' => $planid, 'userid' => $userid));
        } else {
            return self::ACCESS_TYPE_NONE;
        }
    }

    public static function check_edit_permissions(int $planid, int $userid):bool {
        $access = self::get_access_type($planid, $userid);

        return $access == self::ACCESS_TYPE_OWNER || $access == self::ACCESS_TYPE_WRITE;
    }
}
