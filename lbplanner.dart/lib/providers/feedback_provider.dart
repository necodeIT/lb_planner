part of lbplanner_api;

/// Provides feedbacks for the current user
final feedbackProvider = StateNotifierProvider<FeedbackProvider, Map<int, Feedback>>((ref) => FeedbackProvider(ref.watch(userProvider)));

/// Controller for the feedbacks.
final feedbackController = feedbackProvider.notifier;

/// Provides feedbacks for the current user
class FeedbackProvider extends StateNotifier<Map<int, Feedback>> with IRefreshable {
  /// The user to get the feedbacks for
  final User user;

  /// Provides feedbacks for the current user
  FeedbackProvider(this.user) : super({});

  @override
  init() => canRefresh ? fetchFeedbacks() : null;

  /// Gets all feedbacks for the current user
  Future<RawApiResponse> fetchFeedbacks() async {
    var response = await FeedbackApi.getAllFeedbacks(user.token, user.id);

    if (response.succeeded) setState(Map.fromIterable(response.value!, key: (feedback) => feedback.id));

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

  /// Deletes the feedback with the given [id]
  Future<RawApiResponse> deleteFeedback(int id) async {
    assertId(id);

    var response = await FeedbackApi.deleteFeedback(user.token, user.id, id);

    if (response.succeeded) removeValue(id);

    return response;
  }

  /// Creates a new feedback for the current user
  Future<RawApiResponse> submitFeedback(Feedback feedback) async {
    var response = await FeedbackApi.submitFeedback(user.token, user.id, feedback);

    if (response.succeeded) addValue(response.value!.id, response.value!);

    return response;
  }

  @override
  bool get canRefresh => user.isElevated && user.canMakeRequests;

  @override
  onRefresh() => fetchFeedbacks();

  @override
  onUpdate() => reportRefresh();

  @override
  dispose() {
    pauseAutoRefresh();
    super.dispose();
  }
}
