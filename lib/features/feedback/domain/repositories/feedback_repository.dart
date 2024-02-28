import 'dart:async';

import 'package:lb_planner/features/auth/auth.dart';
import 'package:lb_planner/features/feedback/feedback.dart';
import 'package:lb_planner/shared/shared.dart';
import 'package:riverpod/riverpod.dart';

/// Repository responsible for managing [Feedback]s.
///
/// See [feedbackProvider] and [feedbackRepositoryProvider] for usage.
class FeedbackRepository extends AutoRefreshAsyncNotifier<List<Feedback>>
    with RepositoryMixin {
  late FeedbackDataSource _feedbackDataSource;
  late List<UserCapability> _capabilities;

  /// Repository responsible for managing [Feedback]s.
  FeedbackRepository() : super(false);

  @override
  FutureOr<List<Feedback>> build() {
    _feedbackDataSource = ref.watch(feedbackDataSourceProvider);
    _capabilities = ref.watch(userProvider)?.capabilities ?? [];

    return _getFeedbacks();
  }

  @override
  FutureOr<List<Feedback>> onRefresh() => _getFeedbacks();

  Future<List<Feedback>> _getFeedbacks() async {
    if (!_capabilities.hasDev && !_capabilities.hasModerator) return [];

    return _feedbackDataSource.fetchAllFeedbacks();
  }

  /// Submits a new feedback with the given [message] and [type].
  ///
  /// If the [type] is [FeedbackType.bug], [logFilePath] should be provided.
  Future<void> submitFeedback(
    String message,
    FeedbackType type, {
    String? logFilePath,
    void Function()? onError,
  }) async {
    log("Submitting feedback...");

    pause();

    try {
      await _feedbackDataSource.submitFeedback(
        message,
        type,
        logFilePath,
      );

      log("Feedback submitted successfully!");
    } catch (e, stackTrace) {
      log("Failed to submit feedback", e, stackTrace);

      onError?.call();
    }

    resume();
  }

  /// Deletes the given [feedback].
  Future<void> deleteFeedback(Feedback feedback) async {
    log("Deleting feedback...");

    if (!_capabilities.hasDev && !_capabilities.hasModerator) {
      log("User does not have the necessary permissions. Aborting...");
      return;
    }

    await _feedbackDataSource.deleteFeedback(feedback);

    log("Feedback deleted successfully!");
  }

  /// Marks the given [feedback] as read.
  ///
  /// You can optionally provide a [comment] to add to the feedback.
  ///
  /// It is safe to call this method multiple times on the same [feedback] to update the [comment].
  Future<void> markFeedbackAsRead(Feedback feedback, {String? comment}) async {
    log("Marking feedback as read...");

    if (!_capabilities.hasDev && !_capabilities.hasModerator) {
      log("User does not have the necessary permissions. Aborting...");
      return;
    }

    state = const AsyncLoading();

    await _feedbackDataSource.updateFeedback(
      feedback.copyWith(
        readAsInt: 1,
        comment: comment ?? "",
      ),
    );

    log("Feedback marked as read successfully!");
  }

  /// Filters the feedbacks by the given parameters.
  ///
  /// Feedbacks will only be included if they match **all** non null parameters.
  ///
  /// If [state] is [AsyncLoading] or [AsyncError], an empty list will be returned.
  List<Feedback> filterBy({
    FeedbackType? type,
    bool? read,
    int? author,
    int? modifiedBy,
  }) {
    log("Filtering feedbacks by type: $type, read: $read, author: $author, modifiedBy: $modifiedBy");

    if (!state.hasValue) {
      log("State is not ready. Aborting...");

      return [];
    }

    final matches = state.requireValue.where((feedback) {
      if (type != null && feedback.type != type) return false;
      if (read != null && feedback.read != read) return false;
      if (author != null && feedback.author != author) return false;
      if (modifiedBy != null && feedback.modifiedByUserId != modifiedBy) {
        return false;
      }

      return true;
    }).toList();

    log("Found ${matches.length} matches.");

    return matches;
  }
}
