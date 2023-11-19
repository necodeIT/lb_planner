// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'feedback.freezed.dart';
part 'feedback.g.dart';

/// Feedback submitted by the user.
@freezed
class Feedback with _$Feedback {
  const Feedback._();

  /// Feedback submitted by the user.
  factory Feedback({
    /// The ID of this feedback.
    required int id,

    /// The content of this feedback.
    required String content,

    /// The ID of the user who submitted this feedback.
    @JsonKey(name: "userid") required int author,

    /// The type of this feedback.
    required FeedbackType type,

    /// Comments made by [modifiedByUserId] when reading this feedback.
    @JsonKey(name: "notes") @Default("") String comment,

    /// The read status of this feedback as int.
    ///
    /// This is used internally to map the API response. Use [read] instead.
    @JsonKey(name: "status") required int readAsInt,

    /// The timestamp when this feedback was created.
    ///
    /// This is used internally to map the API response. Use [createdAt] instead.
    @JsonKey(name: "timestamp") required int createdAtTimestamp,

    /// The timestamp when this feedback was last modified.
    ///
    /// This is used internally to map the API response. Use [modifiedAt] instead.
    @JsonKey(name: "lastmodified") int? modifiedAtTimestamp,

    /// The ID of the user who last modified this feedback.
    @JsonKey(name: "lastmodifiedby") int? modifiedByUserId,

    /// The path to the log file of the user who submitted this feedback.
    ///
    /// This will only be available if the user is making a bug report, i.e. [type] is [FeedbackType.bug].
    @JsonKey(name: "logfile") String? logfile,
  }) = _Feedback;

  /// `true` if this feedback has been read, `false` otherwise.
  bool get read => readAsInt == 1;

  /// `false` if this feedback has been read, `true` otherwise.
  bool get unread => !read;

  /// The date this feedback was created.
  DateTime get createdAt =>
      DateTime.fromMillisecondsSinceEpoch(createdAtTimestamp * 1000);

  /// The date this feedback was last modified.
  DateTime? get modifiedAt => modifiedAtTimestamp != null
      ? DateTime.fromMillisecondsSinceEpoch(modifiedAtTimestamp! * 1000)
      : null;

  /// Loads feedback from a JSON map
  factory Feedback.fromJson(Map<String, dynamic> json) =>
      _$FeedbackFromJson(json);
}

/// Types of feedback that can be submitted.
enum FeedbackType {
  /// The user is suggesting a new feature or an improvement to an existing feature.
  @JsonValue(0)
  suggestion,

  /// The user is reporting a bug.
  @JsonValue(1)
  bug,

  /// The user is reporting a typo or translation error.
  @JsonValue(2)
  typo,

  /// The user is reporting something else.
  @JsonValue(3)
  other,
}
