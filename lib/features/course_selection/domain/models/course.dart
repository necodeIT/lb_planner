// ignore_for_file: invalid_annotation_target

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'course.freezed.dart';
part 'course.g.dart';

/// A course the user is enrolled in.
///
/// It can be customized by the user to have a different [shortName] and [color].
@freezed
class Course with _$Course {
  Course._();

  /// A course the user is enrolled in.
  ///
  /// It can be customized by the user to have a different [shortName] and [color].
  factory Course({
    /// The id of the course.
    @JsonKey(name: 'courseid') required int id,

    /// The HEX color code of the course.
    ///
    /// Internal only. Use [color] instead.
    @JsonKey(name: 'color') required String colorCode,

    /// The short name of the course.
    @JsonKey(name: 'shortname') required String shortName,

    /// `true` if the course is enabled. `false` otherwise.
    @JsonKey(name: 'enabled') required bool isEnabled,
  }) = _Course;

  /// Creates a [Course] from a JSON object.
  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);

  /// The color of the course.
  Color get color => Color(int.parse('0xFF$colorCode'));
}
