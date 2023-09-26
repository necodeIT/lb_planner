import 'dart:io';

import 'package:path_provider/path_provider.dart';

import 'app_dir_service.dart';

/// Implementation of [AppDirService] for macOS.
///
/// This implementation uses the [getApplicationDocumentsDirectory] function.
/// On macOS applications are sandboxed and the app directory is already unique to the app.
class MacOsAppDirService implements AppDirService {
  @override
  Future<Directory> resolveApplicationDirectory() =>
      getApplicationDocumentsDirectory();
}
