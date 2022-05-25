part of lbplanner_api;

/// Provides the current plan.
final planProvider = StateNotifierProvider<PlanProvider, Plan>((ref) => PlanProvider(ref.watch(userProvider)));

/// Controller for the plan.
final planController = planProvider.notifier;

/// Provides the current plan.
class PlanProvider extends StateNotifier<Plan> with IRefreshable {
  /// The user to get the plan for.
  final User user;

  /// Provides the current plan.
  PlanProvider(this.user) : super(Plan.loading());

  @override
  init() => fetchPlan();

  @override
  onUpdate() => reportRefresh();

  /// Fetches the current plan.
  Future<RawApiResponse> fetchPlan() async {
    final response = await PlanApi.getPlan(user.token, user.planId, user.id);

    setStateFromResponse(response);

    return response;
  }

  /// Updates [Plan.name].
  Future<RawApiResponse> setPlanName(String name) async {
    final response = await PlanApi.updatePlan(user.token, user.id, state.copyWith(name: name));

    setStateFromResponse(response);

    return response;
  }

  /// Updates [Plan.ekEnabled]
  Future<RawApiResponse> setPlanEkEnabled(bool enabled) async {
    final response = await PlanApi.updatePlan(user.token, user.id, state.copyWith(ekEnabled: enabled));

    setStateFromResponse(response);

    return response;
  }

  /// Iinvites the given userId to the plan.
  Future<RawApiResponse> inviteUser(int userId) async {
    final response = await PlanApi.inviteUser(user.token, user.id, state.id, userId);

    if (response.succeeded) notifyListeners();

    return response;
  }

  /// Sets the given [accessLevel] for the given [userId].
  Future<RawApiResponse> setUserAccessLevel(int userId, PlanAccessLevels accessLevel) async {
    final response = await PlanApi.updateAccess(user.token, user.id, state.id, accessLevel, userId);

    setStateFromResponse(response);

    return response;
  }

  /// Adds a deadline to the plan.
  Future<RawApiResponse> addDeadline(Deadline deadline) async {
    final response = await PlanApi.addDeadline(user.token, user.id, state.id, deadline);

    setStateFromResponse(response);

    return response;
  }

  /// Updates the given [deadline].
  Future<RawApiResponse> updateDeadline(Deadline deadline) async {
    final response = await PlanApi.updateDeadline(user.token, user.id, state.id, deadline);

    setStateFromResponse(response);

    return response;
  }

  /// Deletes the given [deadline].
  Future<RawApiResponse> deleteDeadline(Deadline deadline) async {
    final response = await PlanApi.deleteDeadline(user.token, user.id, state.id, deadline.moduleId);

    setStateFromResponse(response);

    return response;
  }

  /// Clears all deadlines from the plan.
  Future<RawApiResponse> clearPlan() async {
    final response = await PlanApi.clearPlan(user.token, user.id, state.id);

    setStateFromResponse(response);

    return response;
  }

  /// Removes the given [userId] from the plan.
  Future<RawApiResponse> removeUser(int userId) async {
    final response = await PlanApi.removeUser(user.token, state.id, user.id, userId);

    setStateFromResponse(response);

    return response;
  }

  /// Removes the current user from the plan.
  Future<RawApiResponse> leavePlan() async {
    final response = await PlanApi.leavePlan(user.token, state.id, user.id);

    setStateFromResponse(response);

    return response;
  }

  @override
  void onRefresh() => fetchPlan();

  @override
  bool get canRefresh => !state.loading;

  @override
  dispose() {
    pauseAutoRefresh();
    super.dispose();
  }
}
