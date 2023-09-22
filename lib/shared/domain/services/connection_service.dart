/// Checks the connection status of the device.
abstract class ConnectionService {
  /// Checks the connection status of the device.
  ///
  /// Returns `true` if the device is connected to the internet, `false` otherwise.
  Future<bool> checkConnection();
}
