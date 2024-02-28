import 'package:lb_planner/features/feedback/feedback.dart';
import 'package:lb_planner/shared/utils/warn_mixin.dart';

/// Implementation of [FeedbackDataSource] when the user is not logged in.
///
/// This implementation will return empty lists, invalid feedbacks, etc. to prevent crashes.
class TokenUnavailableFeedbackDataSource extends FeedbackDataSource
    with StubWarnMixin {
  @override
  Future<void> deleteFeedback(Feedback feedback) async {
    warn("deleteFeedback");
  }

  @override
  Future<List<Feedback>> fetchAllFeedbacks() async {
    warn("fetchAllFeedbacks");

    return [];
  }

  @override
  Future<void> submitFeedback(
    String message,
    FeedbackType type,
    String? logFilePath,
  ) async {
    warn("submitFeedback");
  }

  @override
  Future<void> updateFeedback(Feedback feedback) async {
    warn("updateFeedback");
  }
}
