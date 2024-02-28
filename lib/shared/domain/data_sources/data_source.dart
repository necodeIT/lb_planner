import 'package:lb_planner/shared/shared.dart';
import 'package:logging/logging.dart';

/// Base class for all data sources.
///
/// Provides a method for logging messages and errors.
abstract class DataSource implements ILoggable {
  /// THe name of the data source.
  final String _name;

  /// Base class for all data sources.
  ///
  /// Provides a method for logging messages and errors.
  const DataSource(this._name);

  Logger get _log => Logger("DataSource.$_name.$runtimeType");

  @override
  void log(Object message, [Object? error, StackTrace? stackTrace]) {
    if (error != null) {
      _log.warning(message, error, stackTrace);
      return;
    }

    _log.fine(message, error, stackTrace);
  }
}
