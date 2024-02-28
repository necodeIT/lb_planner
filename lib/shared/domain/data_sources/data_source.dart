import 'package:logging/logging.dart';

/// Base class for all data sources.
///
/// Provides a method for logging messages and errors.
abstract class DataSource {
  /// THe name of the data source.
  final String _name;

  /// Base class for all data sources.
  ///
  /// Provides a method for logging messages and errors.
  DataSource(this._name);

  Logger get _log => Logger("DataSource.$_name.$runtimeType");

  /// Logs a [message] with optional [error] and [stackTrace].
  void log(Object message, [Object? error, StackTrace? stackTrace]) {
    _log.fine(message, error, stackTrace);
  }
}
