part of lbplanner_engine;

/// Concrete implementation of [InternetService] that uses the [InternetAddress.lookup] for checking connection.
class InternetAdressLookupService extends InternetService {
  @override
  Future<bool> checkConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {}

    return false;
  }
}
