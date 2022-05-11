part of lbplanner_api;

/// Provides the current plan.
class PlanProvider extends StateNotifier<AsyncValue<Plan>> {
  /// The user to get the plan for.
  final User user;

  /// Provides the current plan.
  PlanProvider(this.user) : super(AsyncValue.loading());

  /// Fetches the current plan.
  Future<RawApiResponse> fetchPlan() async {
    state = AsyncValue.loading();

    final response = await PlanApi.getPlan(user.token, user.planId, user.id);

    if (response.succeeded) state = AsyncValue.data(response.value!);

    return response;
  }
}
