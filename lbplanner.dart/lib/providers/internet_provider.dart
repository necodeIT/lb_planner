part of lbplanner_api;

/// Provides the current internet connection.
class InternetProvider extends StateNotifier<bool> {
  /// Provides the current internet connection.
  InternetProvider(bool value) : super(false);

  void _update(ConnectivityResult result) {
    setState(result != ConnectivityResult.none);
  }

  @override
  init() {
    Connectivity().onConnectivityChanged.listen(_update);
  }
}
