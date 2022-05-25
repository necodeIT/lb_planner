part of lbplanner_api;

/// Provides all registered users for the current user
final usersProvider = StateNotifierProvider<UsersProvider, Map<int, User>>((ref) => UsersProvider(ref.watch(userProvider)));

/// Controller for the users.
final usersController = usersProvider.notifier;

/// Provides all registered users for the current user
class UsersProvider extends StateNotifier<Map<int, User>> with IRefreshable {
  /// The user to use for the requests
  final User user;

  /// Provides all registered users for the current user
  UsersProvider(this.user) : super({});

  @override
  init() => fetchUsers();

  @override
  onUpdate() => reportRefresh();

  /// Gets all registered users for the current user
  Future<RawApiResponse> fetchUsers() async {
    var response = await UserApi.getAllUsers(user.token, user.id);

    if (response.succeeded) setState(Map.fromEntries(response.value!.map((user) => MapEntry(user.id, user))));

    return response;
  }

  @override
  bool get canRefresh => user.canMakeRequests;

  @override
  onRefresh() => fetchUsers();

  @override
  dispose() {
    pauseAutoRefresh();
    super.dispose();
  }
}
