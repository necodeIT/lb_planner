/// Base class for all classes that can log messages and errors.
abstract class ILoggable {
  /// Logs a [message] with optional [error] and [stackTrace].
  void log(Object message, [Object? error, StackTrace? stackTrace]);
}
