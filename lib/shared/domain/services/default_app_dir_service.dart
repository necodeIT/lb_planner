import 'dart:io';

import 'package:path_provider/path_provider.dart';

import 'app_dir_service.dart';

import 'package:lb_planner/configs/version.dart' as config;

/// The default implementation of [AppDirService].
///
/// This implementation uses the [getApplicationDocumentsDirectory] function and creates a subdirectory for the app based on [config.kAppName].
class DefaultAppDirService implements AppDirService {
  @override
  Future<Directory> resolveApplicationDirectory() async {
    var dir = await getApplicationDocumentsDirectory();

    // TODO: check if macos already creates a subdirectory

    return Directory("${dir.path}/${config.kAppName}").create(recursive: true);
  }
}
