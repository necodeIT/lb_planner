import 'package:logging/logging.dart';

/// Base class for all services.
///
/// Provides a method for logging messages and errors.
abstract class Service {
  /// THe name of the data source.
  final String _name;

  /// Base class for all services.
  ///
  /// Provides a method for logging messages and errors.
  Service(this._name);

  Logger get _log => Logger("Service.$_name.$runtimeType");

  /// Logs a [message] with optional [error] and [stackTrace].
  void log(Object message, [Object? error, StackTrace? stackTrace]) {
    _log.finer(message, error, stackTrace);
  }
}
