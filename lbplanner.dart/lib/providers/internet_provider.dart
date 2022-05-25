part of lbplanner_api;

/// Provides the current internet connection.
final internetProvider = StateNotifierProvider<InternetProvider, bool>((_) => InternetProvider());

/// Controller for the [internetProvider].
final internetController = internetProvider.notifier;

/// Provides the current internet connection.
class InternetProvider extends StateNotifier<bool> with IRefreshable {
  /// Provides the current internet connection.
  InternetProvider() : super(true);

  void _update(ConnectivityResult result) {
    setState(result != ConnectivityResult.none);
  }

  @override
  init() {
    startAutoRefresh();
  }

  @override
  bool get canRefresh => true;

  @override
  Duration get refreshRate => const Duration(milliseconds: 500);

  @override
  bool get silent => true;

  @override
  onRefresh() async {
    try {
      final result = await Connectivity().checkConnectivity();
      _update(result);
    } catch (e) {
      _update(ConnectivityResult.none);
    }
  }

  @override
  dispose() {
    pauseAutoRefresh();

    super.dispose();
  }
}
