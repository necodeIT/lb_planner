part of lbplanner_api;

/// Provides the current internet connection.
final internetProvider = StateNotifierProvider<InternetProvider, bool>((_) => InternetProvider());

/// Controller for the [internetProvider].
final internetController = internetProvider.notifier;

/// Provides the current internet connection.
class InternetProvider extends StateNotifier<bool> {
  /// Provides the current internet connection.
  InternetProvider() : super(true);

  void _update(ConnectivityResult result) {
    setState(result != ConnectivityResult.none);
  }

  @override
  init() {
    Connectivity().onConnectivityChanged.listen(_update);
  }
}
