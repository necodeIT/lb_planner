import 'package:lb_planner/features/feedback/feedback.dart';
import 'package:lb_planner/features/auth/auth.dart';
import 'package:lb_planner/shared/shared.dart';

/// Base class for all feedback data sources.
///
/// A [FeedbackDataSource] is a 1:1 mapping to the API endpoints related to feedback.
abstract class FeedbackDataSource extends DataSource {
  /// Initializes a new instance of [FeedbackDataSource] with logging set up.
  FeedbackDataSource() : super("Feedback");

  /// Submits feedback with the given [message] and [type].
  ///
  /// If [type] is [FeedbackType.bug], the [logFilePath] should be provided.
  Future<void> submitFeedback(
    String message,
    FeedbackType type,
    String? logFilePath,
  );

  /// Returns a list of ALL feedbacks submitted.
  ///
  /// **Note:** This is only available to [UserCapability.moderator] and [UserCapability.dev] users.
  Future<List<Feedback>> fetchAllFeedbacks();

  /// Deletes the given [feedback].
  ///
  /// **Note:** This is only available to [UserCapability.moderator] and [UserCapability.dev] users.
  Future<void> deleteFeedback(Feedback feedback);

  /// Updates the given [feedback] (server-side).
  ///
  /// **Note:** This is only available to [UserCapability.moderator] and [UserCapability.dev] users.
  Future<void> updateFeedback(Feedback feedback);
}
