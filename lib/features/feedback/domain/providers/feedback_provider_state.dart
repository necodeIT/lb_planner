import 'dart:async';

import 'package:lb_planner/features/feedback/feedback.dart';
import 'package:lb_planner/shared/shared.dart';

/// Provides a list of all [Feedback]s in the database.
///
/// Note: The list will be empty if the user does not have the permission to view the feedbacks.
///
/// Also provides CRUD operations for [Feedback]s (Read is implicitly provided by the list and does not have an explicit method).
class FeedbackProviderState extends AutoRefreshAsyncNotifier<List<Feedback>> {
  late FeedbackRepository _feedbackRepository;

  /// Provides a list of all [Feedback]s in the database.
  ///
  /// Note: The list will be empty if the user does not have the permission to view the feedbacks.
  ///
  /// Also provides CRUD operations for [Feedback]s (Read is implicitly provided by the list and does not have an explicit method).
  FeedbackProviderState() : super(false);

  @override
  FutureOr<List<Feedback>> build() {
    _feedbackRepository = ref.watch(feedbackRepositoryProvider);

    return _feedbackRepository.getFeedbacks();
  }

  @override
  FutureOr<List<Feedback>> onRefresh() => _feedbackRepository.getFeedbacks();

  /// Submits a new feedback with the given [message] and [type].
  ///
  /// If the [type] is [FeedbackType.bug], [logFilePath] should be provided.
  Future<void> submitFeedback(
    String message,
    FeedbackType type, {
    String? logFilePath,
  }) async {
    await _feedbackRepository.submitFeedback(
      message,
      type,
      logFilePath,
    );
  }

  /// Deletes the given [feedback].
  Future<void> deleteFeedback(Feedback feedback) async {
    await _feedbackRepository.deleteFeedback(feedback);
  }

  /// Marks the given [feedback] as read.
  ///
  /// You can optionally provide a [comment] to add to the feedback.
  ///
  /// It is safe to call this method multiple times on the same [feedback] to update the [comment].
  Future<void> markFeedbackAsRead(Feedback feedback, {String? comment}) async {
    await _feedbackRepository.updateFeedback(feedback.copyWith(
      readAsInt: 1,
      comment: comment ?? "",
    ));
  }
}
