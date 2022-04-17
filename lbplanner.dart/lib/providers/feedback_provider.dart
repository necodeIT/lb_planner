part of lbplanner_api;

/// Provides feedbacks for the current user
final feedbackProvider = StateNotifierProvider<FeedbackProvider, Map<int, Feedback>>((ref) => FeedbackProvider(ref.watch(userProvider)));

/// Controller for the feedbacks.
final feedbackController = feedbackProvider.notifier;

/// Provides feedbacks for the current user
class FeedbackProvider extends StateNotifier<Map<int, Feedback>> {
  /// Provides feedbacks for the current user
  FeedbackProvider(this.user) : super({}) {
    fetchFeedbacks();
  }

  /// The user to get the feedbacks for
  final User user;

  /// Gets all feedbacks for the current user
  Future<RawApiResponse> fetchFeedbacks() async {
    var response = await FeedbackApi.getAllFeedbacks(user.token, user.id);

    if (response.succeeded) state = Map.fromIterable(response.value!, key: (feedback) => feedback.id);

    return response;
  }

  /// Updates the [status] of the feedback with the given [id]
  Future<RawApiResponse> updateFeedbackStatus(int id, FeedbackStatus status) async {
    assertId(id);

    var oldFeedback = state[id];

    var updatedFeedback = oldFeedback!.copyWith(status: status);

    var response = await FeedbackApi.updateFeedback(user.token, user.id, updatedFeedback);

    if (response.succeeded) updateValue(id, response.value!);

    return response;
  }

  /// Updates the [comment] of the feedback with the given [id]
  Future<RawApiResponse> updateFeedbackComment(int id, String comment) async {
    assertId(id);

    var oldFeedback = state[id];

    var updatedFeedback = oldFeedback!.copyWith(comment: comment);

    var response = await FeedbackApi.updateFeedback(user.token, user.id, updatedFeedback);

    if (response.succeeded) updateValue(id, response.value!);

    return response;
  }
}
