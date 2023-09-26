import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:lb_planner/shared/domain/services/app_dir_service.dart';
import 'package:lb_planner/shared/domain/services/debug_app_dir_service.dart';
import 'package:lb_planner/shared/domain/services/mac_os_app_dir_service.dart';
import 'package:lb_planner/shared/domain/services/windows_app_dir_service.dart';
import 'package:lb_planner/shared/domain/services/linux_app_dir_service.dart';
import 'package:riverpod/riverpod.dart';

/// Provides the current [AppDirService] instance.
final appDirServiceProvider = Provider<AppDirService>((ref) {
  final appDirService = Platform.isLinux
      ? LinuxAppDirService()
      : Platform.isMacOS
          ? MacOsAppDirService()
          : WindowsAppDirService();

  return kDebugMode ? DebugAppDirService(appDirService) : appDirService;
});
