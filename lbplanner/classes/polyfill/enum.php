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

namespace local_lbplanner\polyfill;

use ValueError;

abstract class Enum {
	/**
	 * tries to match the passed value to one of the enum values
	 * @param $value the value to be matched
	 * @return either the matching enum value or null if not found
	 */
	public static function tryFrom(mixed $value): ?mixed {
		$cases = get_class_vars(static::get_classname());
		return in_array($value,$cases,true) ? $value : null;
	}
	/**
	 * tries to match the passed value to one of the enum values
	 * @param $value the value to be matched
	 * @return the matching enum value
	 * @throws ValueError if not found
	 */
	public static function from(mixed $value): mixed {
		$cases = get_class_vars(static::get_classname());
		
		if(!in_array($value,$cases,true)){
			throw new ValueError("value {$value} cannot be represented as a value in enum ".static::get_classname());
		}
		
		return $value;
	}
	public abstract static function get_classname(): string;
}