part of lbplanner_api;

/// Feedback API
class FeedbackApi {
  /// Retrieves all feedbacks submitted to the database.
  static Future<ApiResponse<List<Feedback>>> getAllFeedbacks(String token, int userId) async {
    var response = await Api.makeRequest(
      functionName: "local_lbplanner_feedback_get_all_feedbacks",
      token: token,
      params: {
        "userid": userId,
      },
    );

    List<Feedback>? feedbacks;

    if (response.succeeded) {
      feedbacks = [];

      for (var feedback in response[kApiListContent]) {
        var feedbackMap = Map<String, dynamic>.of(feedback);

        feedbacks.add(Feedback.fromJson(feedbackMap.mapFeedback()));
      }
    }

    return ApiResponse(response.response, feedbacks);
  }

  /// Submits the given [feedback] to the database.
  static Future<ApiResponse<Feedback>> addFeedback(String token, int userId, int type, String content) async {
    var response = await Api.makeRequest(
      functionName: "local_lbplanner_feedback_add_feedback",
      token: token,
      params: {
        "userid": userId,
        "type": type,
        "content": content,
      },
    );

    Feedback? feedback;

    if (response.succeeded) feedback = Feedback.fromJson(response.body.mapFeedback());

    return ApiResponse(response.response, feedback);
  }

  /// Updates the feedback with the given [feedbackId] to the given [status].
  static Future<ApiResponse<Feedback>> updateFeedbackStatus(String token, int userId, int feedbackId, FeedbackStatus status, String? notes) async {
    var response = await Api.makeRequest(
      functionName: "local_lbplanner_feedback_update_feedback",
      token: token,
      params: {
        "feedbackid": feedbackId,
        "status": status.index,
        "userid": userId,
        "notes": notes,
      },
    );

    Feedback? feedback;

    if (response.succeeded) feedback = Feedback.fromJson(response.body.mapFeedback());

    return ApiResponse(response.response, feedback);
  }

  /// Deletes the feedback with the given [feedbackId].
  static Future<ApiResponse<List<Feedback>>> deleteFeedback(String token, int userId, int feedbackId) async {
    var response = await Api.makeRequest(
      functionName: "local_lbplanner_feedback_delete_feedback",
      token: token,
      params: {
        "feedbackid": feedbackId,
        "userid": userId,
      },
    );

    List<Feedback>? feedbacks;

    if (response.succeeded) {
      feedbacks = [];

      for (var feedback in response[kApiListContent]) {
        var feedbackMap = Map<String, dynamic>.of(feedback);

        feedbacks.add(Feedback.fromJson(feedbackMap.mapFeedback()));
      }
    }

    return ApiResponse(response.response, feedbacks);
  }
}
