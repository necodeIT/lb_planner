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
    final response = await apiService.callFunction(
      function: "local_lbplanner_feedback_delete_feedback",
      token: token.lbPlannerApiToken,
      body: {},
    );

    // TODO: replace with `response.failed` once #52 is merged
    if (response.isNotOk) {
      throw Exception("Failed to delete feedback: ${response.body}");
    }
  }

  @override
  Future<List<Feedback>> fetchAllFeedbacks() async {
    final response = await apiService.callFunction(
      function: "local_lbplanner_feedback_get_all_feedbacks",
      token: token.lbPlannerApiToken,
      body: {},
    );

    // TODO: replace with `response.failed` once #52 is merged
    if (response.isNotOk) {
      throw Exception("Failed to fetch all feedbacks: ${response.body}");
    }

    return response
        .expectMultiple()
        .map((e) => Feedback.fromJson(e))
        .toList(growable: false);
  }

  @override
  Future<Feedback> fetchFeedback(int id) async {
    final response = await apiService.callFunction(
      function: "local_lbplanner_feedback_get_feedback",
      token: token.lbPlannerApiToken,
      body: {
        "feedbackid": id,
      },
    );

    // TODO: replace with `response.failed` once #52 is merged
    if (response.isNotOk) {
      throw Exception("Failed to fetch feedback: ${response.body}");
    }

    return Feedback.fromJson(response.expectSingle());
  }

  @override
  Future<void> submitFeedback(
    String message,
    FeedbackType type,
    String? logFilePath,
  ) async {
    final response = await apiService.callFunction(
      function: "local_lbplanner_feedback_submit_feedback",
      token: token.lbPlannerApiToken,
      body: {
        "content": message,
        "type": type.index,
        "logfile": logFilePath,
      },
    );

    // TODO: replace with `response.failed` once #52 is merged
    if (response.isNotOk) {
      throw Exception("Failed to submit feedback: ${response.body}");
    }
  }

  @override
  Future<void> updateFeedback(Feedback feedback) async {
    final response = await apiService.callFunction(
      function: "logfile",
      token: token.lbPlannerApiToken,
      body: {
        "feedbackid": feedback.id,
        "notes": feedback.comment,
        "status": feedback.readAsInt,
      },
    );

    // TODO: replace with `response.failed` once #52 is merged
    if (response.isNotOk) {
      throw Exception("Failed to update feedback: ${response.body}");
    }
  }
}
