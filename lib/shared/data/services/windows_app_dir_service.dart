import 'dart:io';

import 'package:path_provider/path_provider.dart';

import 'package:lb_planner/shared/domain/domain.dart';
import 'package:lb_planner/configs/version.dart' as config;

/// Implementation of [AppDirService] for Windows.
///
/// This implementation uses the [getApplicationDocumentsDirectory] function and creates a subdirectory for the app based on [config.kAppName].
class WindowsAppDirService implements AppDirService {
  @override
  Future<Directory> resolveApplicationDirectory() async {
    var dir = await getApplicationDocumentsDirectory();

    return Directory("${dir.path}/${config.kAppName}").create(recursive: true);
  }
}
