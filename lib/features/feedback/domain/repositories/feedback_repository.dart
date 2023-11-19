import 'package:lb_planner/features/feedback/feedback.dart';
import 'package:lb_planner/features/auth/auth.dart';

/// Base class for all feedback repositories.
abstract class FeedbackRepository {
  /// Submits feedback with the given [message] and [type].
  ///
  /// If [type] is [FeedbackType.bug], the [logFilePath] should be provided.
  Future<void> submitFeedback(
    String message,
    FeedbackType type,
    String? logFilePath,
  );

  /// Returns a list of every feedback submitted.
  ///
  /// If the user does not have the [UserCapability.moderator] or [UserCapability.dev] capability, an empty list will be returned.
  Future<List<Feedback>> getAllFeedbacks();

  /// Deletes the given [feedback].
  ///
  /// If the user does not have the [UserCapability.moderator] or [UserCapability.dev] capability, this method will instantly exit without doing anything.
  Future<void> deleteFeedback(Feedback feedback);

  /// Updates the given [feedback] (server-side).
  ///
  /// If the user does not have the [UserCapability.moderator] or [UserCapability.dev] capability, this method will instantly exit without doing anything.
  Future<void> updateFeedback(Feedback feedback);
}
