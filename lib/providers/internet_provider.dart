part of lbplanner_engine;

/// Provides the current internet connection.
final internetProvider = StateNotifierProvider<InternetProvider, bool>(
  (_) => InternetProvider(
    Platform.isLinux ? InternetAdressLookupService() : InternetConnectivityService(),
  ),
);

/// Controller for the [internetProvider].
final internetController = internetProvider.notifier;

/// Provides the current internet connection.
class InternetProvider extends StateNotifier<bool> with IRefreshable {
  static bool _connected = false;

  /// The [InternetService] used for checking the internet connection.
  final InternetService _internetService;

  /// Provides the current internet connection.
  InternetProvider(this._internetService) : super(true);

  /// Whether the device is currently connected to the internet.
  static bool get connected => _connected;

  @override
  init() => startAutoRefresh();

  @override
  bool get canRefresh => true;

  @override
  Duration get refreshRate => const Duration(milliseconds: 500);

  @override
  bool get silent => true;

  @override
  onRefresh() async {
    state = _connected = await _internetService.checkConnection();
  }

  @override
  dispose() {
    pauseAutoRefresh();

    super.dispose();
  }
}
