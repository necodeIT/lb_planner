import 'dart:io';

import 'package:lb_planner/shared/shared.dart';

/// `AppDirService` is an abstract base class that provides a contract for all application directory services.
///
/// It is used to determine the directory where the application should store its files.
///
/// This class is intended to be extended by concrete implementations that provide specific ways to determine
/// the application directory based on the platform or other criteria.
abstract class AppDirService extends Service {
  /// Initializes a new instance of [AppDirService] with logging set up.
  AppDirService() : super("AppDir");

  /// Returns a [Future] that resolves to a [Directory] object representing the directory where the application should store its files.
  Future<Directory> resolveApplicationDirectory();
}
