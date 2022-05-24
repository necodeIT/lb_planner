part of lbplanner_api;

/// Provides information about the current internet connection using [Connectivity].
final kInternet = Internet();

/// Do not instantiate this class. Use [kInternet] instead.
///
/// Provides information about the current internet connection using [Connectivity].
class Internet extends IRefreshable {
  /// Do not instantiate this class. Use [kInternet] instead.
  ///
  /// Provides information about the current internet connection using [Connectivity].
  constInternet() {
    startAutoRefresh();
  }

  bool _connected = false;

  /// Whether the API is connected to the internet / server.
  bool get connected => _connected;

  @override
  bool get canRefresh => true;

  @override
  onRefresh() async => _connected = await Connectivity().checkConnectivity() != ConnectivityResult.none;
}
