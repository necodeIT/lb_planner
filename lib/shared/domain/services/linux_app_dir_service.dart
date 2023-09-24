import 'dart:io';

import 'package:lb_planner/shared/domain/services/app_dir_service.dart';

import 'package:lb_planner/configs/version.dart' as config;

/// The [AppDirService] implementation for Linux.
///
/// This implementation uses the `~/.config` directory.
class LinuxAppDirService extends AppDirService {
  @override
  Future<Directory> resolveApplicationDirectory() async {
    const path = "~/.config/${config.kAppName}";

    return Directory(path).create(recursive: true);
  }
}
