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

use external_single_structure;
use external_value;
use external_multiple_structure;

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
        $members = $DB->get_records(self::ACCESS_TABLE, array('planid' => $planid));
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

    public static function get_deadlines(int $planid): array {
        global $DB;

        $dbdeadlines = $DB->get_records(self::DEADLINES_TABLE, array('planid' => $planid));

        $deadlines = array();

        foreach ($dbdeadlines as $dbdeadline) {
            $deadlines[] = array(
                'planid' => $dbdeadline->planid,
                'deadlinestart' => $dbdeadline->deadlinestart,
                'deadlineend' => $dbdeadline->deadlineend,
                'moduleid' => $dbdeadline->moduleid,
            );
        }

        return $deadlines;
    }

    public static function get_plan(int $planid) : array {
        global $DB;

        $plan = $DB->get_record(self::TABLE, array('id' => $planid));
        $members = array();

        foreach (self::get_plan_members($planid) as $member) {
            $members[] = array(
                'userid' => $member->userid,
                'accesstype' => $member->accesstype,
            );
        }

        return array(
            'name' => $plan->name,
            'planid' => $planid,
            'enableek' => $plan->enableek,
            'deadlines' => self::get_deadlines($planid),
            'members' => $members,
        );
    }

    public static function plan_structure() : external_single_structure {
        return new external_single_structure(
            array(
                'name' => new external_value(PARAM_TEXT, 'The name of the plan'),
                'planid' => new external_value(PARAM_INT, 'The id of the plan'),
                'enableek' => new external_value(PARAM_BOOL, 'If the plan is enabled for ek'),
                'deadlines' => new external_multiple_structure(
                    new external_single_structure(
                        array(
                            'planid' => new external_value(PARAM_INT, 'The id of the user'),
                            'moduleid' => new external_value(PARAM_INT, 'The id of the user'),
                            'deadlinestart' => new external_value(PARAM_INT, 'The id of the user'),
                            'deadlineend' => new external_value(PARAM_INT, 'The id of the user'),
                        )
                    )
                ),
                'members' => new external_multiple_structure(
                    new external_single_structure(
                        array(
                            'userid' => new external_value(PARAM_INT, 'The id of the user'),
                            'accesstype' => new external_value(PARAM_TEXT, 'The role of the user'),
                        )
                    )
                ),
            )
        );
    }

    public static function copy_plan($planid, $userid) : int {
        global $DB;

        $user = user_helper::get_mdl_user_info($userid);

        $plan = $DB->get_record(self::TABLE, array('id' => $planid));
        $plan->name = $plan->name . ' (' . $user->username . ')';
        $plan->id = null;

        $deadlines = self::get_deadlines($planid);

        $newplanid = $DB->insert_record(self::TABLE, $plan);

        for ($i = 0; $i < count($deadlines); $i++) {
            $catgirl = $deadlines[$i];
            $catgirl->planid = $newplanid;
            $catgirl->id = null;

            $DB->insert_record(self::DEADLINES_TABLE, $catgirl);
        }

        return $newplanid;
    }
}
