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
    required int totalModules,

    /// The number of modules that are late.
    required int lateModules,

    /// The number of modules that are pending.
    required int pendingModules,

    /// The number of modules the user has completed.
    required int completedModules,

    /// The number of modules the user has uploaded.
    required int uploadedModules,

    /// Statistics for courses.
    /// Key: course id
    /// Value: statistics for the course
    @Default(null) Map<int, Statistics>? courseStats,
  }) = _Statistics;

  /// Statistics model from json.
  factory Statistics.fromJson(Map<String, dynamic> json) => _$StatisticsFromJson(json);
}
