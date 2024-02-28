import 'package:lb_planner/features/auth/auth.dart';
import 'package:lb_planner/features/feedback/feedback.dart';
import 'package:lb_planner/shared/shared.dart';

/// Standard implementation of [FeedbackDataSource].
class StdFeedbackDataSource extends FeedbackDataSource {
  /// The api service to use for making requests.
  final ApiService apiService;

  /// The token to use for making requests.
  final UserToken token;

  /// Standard implementation of [FeedbackDataSource].
  StdFeedbackDataSource(this.apiService, this.token);

  @override
  Future<void> deleteFeedback(Feedback feedback) async {
    log("Deleting feedback#$feedback");

    final response = await apiService.callFunction(
      function: "local_lbplanner_feedback_delete_feedback",
      token: token.lbPlannerApiToken,
      body: {},
    );

    if (response.failed) {
      log("Failed to delete feedback#${feedback.id}", response.body);

      throw Exception(
        "Failed to delete feedback#${feedback.id}: ${response.body}",
      );
    }

    log("Sucessfully deleted feedback#$feedback");
  }

  @override
  Future<List<Feedback>> fetchAllFeedbacks() async {
    log("Fetching all feedbacks");

    final response = await apiService.callFunction(
      function: "local_lbplanner_feedback_get_all_feedbacks",
      token: token.lbPlannerApiToken,
      body: {},
    );

    if (response.failed) {
      log("Failed to fetch all feedbacks", response.body);

      throw Exception("Failed to fetch all feedbacks: ${response.body}");
    }

    final feedbacks = response
        .expectMultiple()
        .map((e) => Feedback.fromJson(e))
        .toList(growable: false);

    log("Fetched ${feedbacks.length} feedbacks");

    return feedbacks;
  }

  @override
  Future<void> submitFeedback(
    String message,
    FeedbackType type,
    String? logFilePath,
  ) async {
    log("Submitting feedback: $message");

    final response = await apiService.callFunction(
      function: "local_lbplanner_feedback_submit_feedback",
      token: token.lbPlannerApiToken,
      body: {
        "content": message,
        "type": type.index,
        "logfile": logFilePath,
      },
    );

    if (response.failed) {
      log("Failed to submit feedback", response.body);

      throw Exception("Failed to submit feedback: ${response.body}");
    }

    log("Sucessfully submitted feedback");
  }

  @override
  Future<void> updateFeedback(Feedback feedback) async {
    log("Updating feedback#$feedback");

    final response = await apiService.callFunction(
      function: "logfile",
      token: token.lbPlannerApiToken,
      body: {
        "feedbackid": feedback.id,
        "notes": feedback.comment,
        "status": feedback.readAsInt,
      },
    );

    if (response.failed) {
      log("Failed to update feedback#$feedback", response.body);

      throw Exception("Failed to update feedback: ${response.body}");
    }

    log("Sucessfully updated feedback#$feedback");
  }
}
