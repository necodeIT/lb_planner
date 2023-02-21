part of lbplanner_engine;

/// Provides status information about the latest app update.
final updateProvider = StateNotifierProvider<UpdateProvider, UpdateStatus>((ref) {
  UpdaterService service;

  switch (kSetupType) {
    case SetupType.appImage:
      service = AppImageUpdaterService();
      break;
    case SetupType.dmg:
      service = DmgUpdaterService();
      break;
    case SetupType.exe:
      service = ExeUpdaterService();
      break;
    case SetupType.aur:
      service = AurUpdaterService();
      break;
    case SetupType.aurGit:
      service = AurGitUpdaterService();
      break;
    case SetupType.selfCompiled:
      service = SelfCompiledUpdaterService();
      break;
  }

  return UpdateProvider(service, ref.watch(userProvider));
});

/// Controller for fetching status information about the latest app update.
final updateController = updateProvider.notifier;

/// Provides status information about the latest app update.
class UpdateProvider extends StateNotifier<UpdateStatus> {
  final UpdaterService _updaterService;
  final User _user;

  Update _info = Update();

  /// Provides status information about the latest app update.
  UpdateProvider(this._updaterService, this._user) : super(UpdateStatus());

  /// Checks for updates.
  Future<void> checkForUpdates() async {
    var response = await PluginConfigApi.getVersion(_user.token);

    if (response.failed) return;

    _info = await _updaterService.checkForUpdates(response.value!);

    state = _info.toUpdateStatus();
  }

  /// Upgrades the app.
  Future<void> upgrade() async {
    await for (var status in _updaterService.upgrade(_info)) {
      if (mounted) state = status;
    }
  }
}
