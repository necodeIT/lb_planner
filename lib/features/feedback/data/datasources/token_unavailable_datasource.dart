import 'package:lb_planner/features/feedback/feedback.dart';

/// Implementation of [FeedbackDataSource] when the user is not logged in.
///
/// This implementation will return empty lists, invalid feedbacks, etc. to prevent crashes.
class TokenUnavailableFeedbackDataSource extends FeedbackDataSource {
  @override
  Future<void> deleteFeedback(Feedback feedback) async {}

  @override
  Future<List<Feedback>> fetchAllFeedbacks() async => [];

  @override
  Future<Feedback> fetchFeedback(int id) async => Feedback(
        id: -1,
        content: "",
        userId: -1,
        type: FeedbackType.bug,
        readAsInt: 0,
        createdAtTimestamp: 0,
      );

  @override
  Future<void> submitFeedback(
      String message, FeedbackType type, String? logFilePath) async {}

  @override
  Future<void> updateFeedback(Feedback feedback) async {}
}
