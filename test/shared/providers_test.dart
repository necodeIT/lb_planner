import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lb_planner/shared/data/data.dart';
import 'package:lb_planner/shared/shared.dart';
import 'package:riverpod/riverpod.dart';

import '../hooks.dart';

void main() {
  final container = ProviderContainer();

  group("networkServiceProvider", () {
    test("should be a NetworkService", () {
      final networkService = container.read(networkServiceProvider);
      expect(networkService, isA<NetworkService>());
    });

    test("should be a DioNetworkService", () {
      final networkService = container.read(networkServiceProvider);
      expect(networkService, isA<DioNetworkService>());
    });
  });

  group("apiServiceProvider", () {
    test("should be an ApiService", () {
      final apiService = container.read(apiServiceProvider);
      expect(apiService, isA<ApiService>());
    });

    test("should be a MoodleApiService", () {
      final apiService = container.read(apiServiceProvider);
      expect(apiService, isA<MoodleApiService>());
    });
  });

  group("appDirServiceProvider", () {
    tearDownAll(() {
      clearTestDir();
    });

    setUpAll(() {
      useTestPathProviderPlatform();

      clearTestDir();
    });

    test("should be a AppDirService", () {
      final appDirService = container.read(appDirServiceProvider);

      expect(appDirService, isA<AppDirService>());
    });

    test(
        "should be a DebugAppDirService (as test suite is running in debug mode)",
        () {
      final appDirService = container.read(appDirServiceProvider);

      if (kDebugMode) {
        expect(appDirService, isA<DebugAppDirService>());
      }
    });

    test("should be a LinuxAppDirService on Linux", () {
      final appDirService = container.read(appDirServiceProvider);

      if (Platform.isLinux) {
        var debugAppDirService = appDirService as DebugAppDirService;

        expect(debugAppDirService.appDirService, isA<LinuxAppDirService>());
      }
    });

    test("should not be a LinuxAppDirService if not on Linux", () {
      final appDirService = container.read(appDirServiceProvider);

      if (!Platform.isLinux) {
        var debugAppDirService = appDirService as DebugAppDirService;

        expect(
            debugAppDirService.appDirService, isNot(isA<LinuxAppDirService>()));
      }
    });

    test("should be a WindowsAppDirService on Windows", () {
      final appDirService = container.read(appDirServiceProvider);

      if (Platform.isWindows) {
        var debugAppDirService = appDirService as DebugAppDirService;

        expect(debugAppDirService.appDirService, isA<WindowsAppDirService>());
      }
    });

    test("should not be a WindowsAppDirService if not on Windows", () {
      final appDirService = container.read(appDirServiceProvider);

      if (!Platform.isWindows) {
        var debugAppDirService = appDirService as DebugAppDirService;

        expect(debugAppDirService.appDirService,
            isNot(isA<WindowsAppDirService>()));
      }
    });

    test("should be a MacOsAppDirService on macOS", () {
      final appDirService = container.read(appDirServiceProvider);

      if (Platform.isMacOS) {
        var debugAppDirService = appDirService as DebugAppDirService;

        expect(debugAppDirService.appDirService, isA<MacOsAppDirService>());
      }
    });

    test("should not be a MacOsAppDirService if not on macOS", () {
      final appDirService = container.read(appDirServiceProvider);

      if (!Platform.isMacOS) {
        var debugAppDirService = appDirService as DebugAppDirService;

        expect(
            debugAppDirService.appDirService, isNot(isA<MacOsAppDirService>()));
      }
    });

    test("resolveApplicationDirectory should return a directory that exists",
        () async {
      final appDirService = container.read(appDirServiceProvider);

      var dir = await appDirService.resolveApplicationDirectory();

      expect(dir.existsSync(), true);
    });
  });

  group("connectionServiceProvider", () {
    test("should be a bool", () {
      final connectionService = container.read(connectionServiceProvider);

      expect(connectionService, isA<bool>());
    });
  });
}
