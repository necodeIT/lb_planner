import 'dart:io';

import 'package:lb_planner/shared/domain/domain.dart';

/// `DebugAppDirService` is a specialized version of [AppDirService] that is designed for debugging purposes.
/// It wraps an existing [AppDirService] instance and modifies its behavior to create a `/debug` subdirectory
/// within the application directory.
///
/// This is useful for segregating debug-related files from the main application directory, making it easier
/// to manage files during debugging.
///
/// Takes an [AppDirService] instance as an argument, which this class will wrap and modify.
///
/// Example:
/// ```dart
/// var originalService = AppDirService();
/// var debugService = DebugAppDirService(originalService);
/// ```
class DebugAppDirService extends AppDirService {
  /// The original [AppDirService] instance that this class will wrap and modify.
  final AppDirService appDirService;

  /// [DebugAppDirService] is a specialized version of [AppDirService] that is designed for debugging purposes.
  /// It wraps an existing [AppDirService] instance and modifies its behavior to create a `/debug` subdirectory
  /// within the application directory.
  ///
  /// This is useful for segregating debug-related files from the main application directory, making it easier
  /// to manage files during debugging.
  ///
  /// Takes an [AppDirService] instance as an argument, which this class will wrap and modify.
  ///
  /// Example:
  /// ```dart
  /// var originalService = AppDirService();
  /// var debugService = DebugAppDirService(originalService);
  /// ```
  DebugAppDirService(this.appDirService);

  @override
  Future<Directory> resolveApplicationDirectory() async {
    // Fetch the original application directory from the wrapped service
    var dir = await appDirService.resolveApplicationDirectory();

    // Create a '/debug' subdirectory inside the original directory
    return Directory("${dir.path}/debug").create(recursive: true);
  }
}
