import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:lb_planner/shared/domain/services/debug_app_dir_service.dart';
import 'package:lb_planner/shared/domain/services/default_app_dir_service.dart';
import 'package:lb_planner/shared/domain/services/linux_app_dir_service.dart';
import 'package:riverpod/riverpod.dart';

/// Provides the current [AppDirService] instance.
final appDirServiceProvider = Provider((ref) {
  final appDirService = Platform.isLinux ? LinuxAppDirService() : DefaultAppDirService();

  return kDebugMode ? DebugAppDirService(appDirService) : appDirService;
});
