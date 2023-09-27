import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:lb_planner/shared/shared.dart';
import 'package:lb_planner/shared/data/data.dart';
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
