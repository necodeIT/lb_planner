part of lbplanner_engine;

/// Concrete implementation of [InternetService] using [Connectivity] for checking.
class InternetConnectivityService extends InternetService {
  @override
  Future<bool> checkConnection() async {
    try {
      final result = await Connectivity().checkConnectivity();

      return result != ConnectivityResult.none;
    } catch (e) {
      return false;
    }
  }
}
