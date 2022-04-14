// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'deadline.freezed.dart';
part 'deadline.g.dart';

@freezed

/// Deadline model.
class Deadline with _$Deadline {
  const Deadline._();

  /// Deadline model.
  factory Deadline({
    /// The id of the module the deadline is for.
    required int moduleId,

    /// The start date of the deadline.
    required DateTime start,

    /// The end date of the deadline.
    required DateTime end,
  }) = _Deadline;

  /// Deadline model from json.
  factory Deadline.fromJson(Map<String, dynamic> json) => _$DeadlineFromJson(json);
}
