import 'package:lb_planner/features/auth/auth.dart';
import 'package:lb_planner/features/feedback/feedback.dart';

/// Standard implementation of [FeedbackRepository].
class StdFeedbackRepository extends FeedbackRepository {
  /// The data source to use for making requests.
  final FeedbackDataSource feedbackDataSource;

  /// The capabilities of the current user.
  ///
  /// This is used to determine whether the user can perform certain actions.
  ///
  /// If any action cannot be performed, the corresponding method will return empty data.
  /// Candidates for this are [getAllFeedbacks], [deleteFeedback] and [updateFeedback].
  final List<UserCapability> capabilities;

  /// Standard implementation of [FeedbackRepository].
  StdFeedbackRepository(this.feedbackDataSource, this.capabilities);

  @override
  Future<void> deleteFeedback(Feedback feedback) async {
    if (!capabilities.hasDev && !capabilities.hasModerator) return;

    return feedbackDataSource.deleteFeedback(feedback);
  }

  @override
  Future<List<Feedback>> getAllFeedbacks() async {
    if (!capabilities.hasDev && !capabilities.hasModerator) return [];

    return feedbackDataSource.fetchAllFeedbacks();
  }

  @override
  Future<void> submitFeedback(
    String message,
    FeedbackType type,
    String? logFilePath,
  ) {
    return feedbackDataSource.submitFeedback(message, type, logFilePath);
  }

  @override
  Future<void> updateFeedback(Feedback feedback) async {
    if (!capabilities.hasDev && !capabilities.hasModerator) return;

    return feedbackDataSource.updateFeedback(feedback);
  }
}
