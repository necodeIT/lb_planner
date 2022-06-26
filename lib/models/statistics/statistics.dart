// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'statistics.freezed.dart';
part 'statistics.g.dart';

@freezed

/// Statistics model.
class Statistics with _$Statistics {
  const Statistics._();

  /// Statistics model.
  const factory Statistics({
    /// The number of total modules the user has.
    @Default(0) int totalModules,

    /// The number of modules that are late.
    @Default(0) int lateModules,

    /// The number of modules that are pending.
    @Default(0) int pendingModules,

    /// The number of modules the user has completed.
    @Default(0) int completedModules,

    /// The number of modules the user has uploaded.
    @Default(0) int uploadedModules,

    /// Statistics for courses.
    /// Key: course id
    /// Value: statistics for the course
    @Default({}) Map<int, Statistics> courseStats,
  }) = _Statistics;

  /// Statistics model from json.
  factory Statistics.fromJson(Map<String, dynamic> json) => _$StatisticsFromJson(json);
}
