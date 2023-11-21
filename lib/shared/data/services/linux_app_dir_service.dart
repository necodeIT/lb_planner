import 'dart:io';

import 'package:lb_planner/shared/domain/domain.dart';

import 'package:lb_planner/configs/version.dart' as config;

/// The [AppDirService] implementation for Linux.
///
/// This implementation uses the `~/.config` directory.
class LinuxAppDirService extends AppDirService {
  @override
  Future<Directory> resolveApplicationDirectory() async {
    // ugly, i know... however i dont know how to achieve this in a better way (yet)
    // return Directory("./testing") if we are running tests
    if (Platform.environment.containsKey('FLUTTER_TEST')) {
      return Directory("./testing");
    }

    const path = "~/.config/${config.kAppName}";

    return Directory(path).create(recursive: true);
  }
}
