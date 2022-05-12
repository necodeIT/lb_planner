part of lbplanner_api;

/// Provides modules for the current user
final modulesProvider = StateNotifierProvider<ModulesProvider, Map<int, Module>>((ref) {
  ref.watch(coursesProvider);
  return ModulesProvider(ref.watch(userProvider));
});

/// Controller for the modules.
final modulesController = modulesProvider.notifier;

/// Provides modules for the current user
class ModulesProvider extends StateNotifier<Map<int, Module>> {
  /// The user to get the modules for
  final User user;

  /// Provides modules for the current user
  ModulesProvider(this.user) : super({});

  @override
  init() => fetchModules();

  /// Gets all modules for the current user
  Future<RawApiResponse> fetchModules() async {
    var response = await ModulesApi.getAllModules(user.token, user.id);

    if (response.succeeded) setState(Map.fromIterable(response.value!, key: (module) => module.id));

    return response;
  }
}
