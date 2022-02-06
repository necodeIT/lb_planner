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

use stdClass;

class notifications_helper {
    const TABLE = 'local_lbplanner_notfications';

    const STATUS_READ = 1;
    const STATUS_UNREAD = 0;

    const TRIGGER_INVITE = 0;
    const TRIGGER_INVITE_ACCEPTED = 1;
    const TRIGGER_INVITE_DECLINED = 2;
}
