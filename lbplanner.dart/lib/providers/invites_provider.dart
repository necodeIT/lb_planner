part of lbplanner_api;

/// Provides all invitations for the current user
final invitesProvider = StateNotifierProvider<InvitesProvider, Map<int, PlanInvite>>((ref) => InvitesProvider(ref.watch(userProvider)));

/// Controller for the invites.
final invitesController = invitesProvider.notifier;

/// Provides all invitations for the current user
class InvitesProvider extends StateNotifier<Map<int, PlanInvite>> with IRefreshable {
  /// The user to get the invitations for
  final User user;

  /// Provides all invitations for the current user
  InvitesProvider(this.user) : super({});

  @override
  init() {
    fetchInvites();
    startAutoRefresh();
  }

  /// Gets all invitations for the current user
  Future<RawApiResponse> fetchInvites() async {
    var response = await PlanApi.getInvites(user.token, user.id);

    if (response.succeeded) setState({for (var invite in response.value!) invite.id: invite});

    return response;
  }

  /// Accepts an invitation
  Future<RawApiResponse> acceptInvite(int id) async {
    assertId(id);

    var response = await PlanApi.acceptInvite(user.token, state[id]!);

    if (response.succeeded) updateValue(id, response.value!);

    return response;
  }

  /// Declines an invitation
  Future<RawApiResponse> declineInvite(int id) async {
    assertId(id);

    var response = await PlanApi.declineInvite(user.token, state[id]!);

    if (response.succeeded) updateValue(id, response.value!);

    return response;
  }

  @override
  bool get canRefresh => user.canMakeRequests;

  @override
  onRefresh() => fetchInvites();

  @override
  onUpdate() => reportRefresh();

  @override
  dispose() {
    pauseAutoRefresh();
    super.dispose();
  }
}
