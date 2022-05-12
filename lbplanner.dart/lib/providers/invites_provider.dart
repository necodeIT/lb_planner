part of lbplanner_api;

/// Provides all invitations for the current user
final invitesProvider = StateNotifierProvider<InvitesProvider, Map<int, PlanInvite>>((ref) => InvitesProvider(ref.watch(userProvider)));

/// Controller for the invites.
final invitesController = invitesProvider.notifier;

/// Provides all invitations for the current user
class InvitesProvider extends StateNotifier<Map<int, PlanInvite>> {
  /// The user to get the invitations for
  final User user;

  /// Provides all invitations for the current user
  InvitesProvider(this.user) : super({});

  @override
  init() => fetchInvites();

  /// Gets all invitations for the current user
  Future<RawApiResponse> fetchInvites() async {
    var response = await PlanApi.getInvites(user.token, user.id);

    if (response.succeeded) setState({for (var invite in response.value!) invite.planId: invite});

    return response;
  }

  /// Updates the invitation for the given [planId] with the given [status]
  Future<RawApiResponse> updateInviteStatus(int planId, PlanInviteStatus status) async {
    assertId(planId);

    var oldInvite = state[planId];

    var updatedInvite = oldInvite!.copyWith(status: status);

    var response = await PlanApi.updateInvite(user.token, updatedInvite);

    if (response.succeeded) updateValue(planId, response.value!);

    return response;
  }
}
