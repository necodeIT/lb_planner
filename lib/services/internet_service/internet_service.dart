part of lbplanner_engine;

/// Service for checking internet connection.
abstract class InternetService {
  /// Checks if the device is connected to the internet.
  Future<bool> checkConnection();
}
