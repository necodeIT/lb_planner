import 'package:logging/logging.dart';

/// Mixin for all repositories that provides a method for logging messages and errors.
///
/// All repositories should mixin this class.
///
/// ```dart
/// class MyRepository extends Notifier<T> with RepositoryMixin {
///  // ...
/// }
mixin RepositoryMixin {
  Logger get _log => Logger("Repository.$runtimeType");

  /// Logs a [message] with optional [error] and [stackTrace].
  void log(Object message, [Object? error, StackTrace? stackTrace]) {
    _log.info(message, error, stackTrace);
  }
}
