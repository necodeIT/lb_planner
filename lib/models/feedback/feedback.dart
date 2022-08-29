// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:lbplanner_engine/lbplanner_engine.dart';

part 'feedback.freezed.dart';
part 'feedback.g.dart';

@freezed

/// Feedback model
class Feedback with _$Feedback {
  const Feedback._();

  /// Feedback model
  const factory Feedback({
    /// ID of the feedback
    required int id,

    /// The user who sent the feedback.
    required int userId,

    /// The content of the feedback.
    required String content,

    /// Notes admins may add to the feedback.
    @Default("") String comment,

    /// Name of the client log file.
    @Default("") String logFile,

    /// The type of the feedback.
    required FeedbackTypes type,

    /// The status of the feedback.
    required FeedbackStatus status,

    /// The id of the user who last modified the feedback.
    int? lastModifiedBy,

    /// The date the feedback was last modified.
    DateTime? lastModified,

    /// The date the feedback was created.
    required DateTime timestamp,
  }) = _Feedback;

  /// Feedback model from json
  factory Feedback.fromJson(Map<String, dynamic> json) => _$FeedbackFromJson(json);
}
