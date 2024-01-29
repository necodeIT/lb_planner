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

use ReflectionClass;
use ValueError;

abstract class Enum {
	/**
	 * tries to match the passed value to one of the enum values
	 * @param mixed $value the value to be matched
	 * @return mixed either the matching enum value or null if not found
	 */
	public static function tryFrom(mixed $value): mixed {
		$cases = static::cases();
		foreach($cases as $case){
			if($case->value === $value)
				return $value;
		}
		return null;
	}
	/**
	 * tries to match the passed value to one of the enum values
	 * @param mixed $value the value to be matched
	 * @return mixed the matching enum value
	 * @throws ValueError if not found
	 */
	public static function from(mixed $value): mixed {
		$cases = static::cases();
		foreach($cases as $case){
			if($case->value === $value)
				return $value;
		}
		
		throw new ValueError("value {$value} cannot be represented as a value in enum ".static::class);
	}
	/**
	 * @return EnumCase[] array of cases inside this enum
	 */
	public static function cases(): array {
		$reflection = new ReflectionClass(static::class);
		$cases = [];
		foreach($reflection->getConstants() as $name=>$val){
			array_push($cases,new EnumCase($name,$val));
		}
		return $cases;
	}
	/**
	 * Formats all possible enum values into a string
	 * Example:
	 * (31=>RED,32=>GREEN,33=>YELLOW)
	 * @return string the resulting string
	 */
	public static function format(): string {
		$result = "[";
		$cases = static::cases();
		foreach($cases as $case) {
			$result .= "{$case->value}=>{$case->name},";
		}
		$result[-1] = ']';
		return $result;
	}
}

class EnumCase {
	public string $name;
	public mixed $value;
	public function __construct($name,$value){
		$this->name = $name;
		$this->value = $value;
	}
}