import 'package:lb_planner/shared/shared.dart';

/// Checks the connection status of the device.
abstract class ConnectionService extends Service {
  /// Initializes a new instance of [ConnectionService] with logging set up.
  ConnectionService() : super("Connection");

  /// Checks the connection status of the device.
  ///
  /// Returns `true` if the device is connected to the internet, `false` otherwise.
  Future<bool> checkConnection();
}
