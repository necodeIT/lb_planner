import 'package:lb_planner/shared/shared.dart';
import 'package:logging/logging.dart';

/// A mixin that adds a [warn] method to a class.
///
/// This is used for stub classes that should warn the developer when they are used.
mixin StubWarnMixin on ILoggable {
  /// Logs a warning that a method was called on a stub class.
  ///
  /// Use this if the method will not cause any errors.
  ///
  /// Usage:
  ///
  /// ```dart
  /// class Example with StubWarnMixin  {
  ///   @override
  ///   Future<YourData> example() async {
  ///     warn("example");
  ///     return InvalidDataThatWillNotCauseErrors();
  ///   }
  /// }
  /// ```
  ///
  /// If you think that the method may cause errors, use [error] instead.
  void warn(String method) {
    log(
      "Method `$runtimeType.$method` was called on a stub class. Even though this should not happen, you can releax, as this won't cause any errors.",
    );
  }

  /// Logs an error that a method was called on a stub class.
  ///
  /// Use this if the method will cause errors.
  ///
  /// Usage:
  ///
  /// ```dart
  /// class Example with StubWarnMixin  {
  ///   @override
  ///   Future<YourData> example() async {
  ///     warn("example");
  ///     return InvalidDataThatWillCauseErrors();
  ///   }
  /// }
  /// ```
  void error(String method) {
    log(
      "Method `$method` was called on a stub class ($runtimeType). THIS SHOULD NOT HAPPEN. This may cause errors.",
    );
  }
}
