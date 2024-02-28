import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:lb_planner/shared/domain/domain.dart';

/// Implementation of [AppDirService] for macOS.
///
/// This implementation uses the [getApplicationDocumentsDirectory] function.
/// On macOS applications are sandboxed and the app directory is already unique to the app.
class MacOsAppDirService extends AppDirService {
  @override
  Future<Directory> resolveApplicationDirectory() =>
      getApplicationDocumentsDirectory();
}
