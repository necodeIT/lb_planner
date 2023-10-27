import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lb_planner/features/update/data/data.dart';
import 'package:lb_planner/features/update/update.dart';
import 'package:lb_planner/shared/data/data.dart';
import 'package:lb_planner/shared/shared.dart';

import '../../config.dart';
import 'datasources_test.dart';

void main() {
  group("PatcherService", () {
    final dio = Dio();

    final downloadService = DioDownloadService(
      dio,
    );

    final context = FakeBuildContext();

    final release = Release(
        channel: BuildChannel.stable,
        versionString: Version(major: 1, minor: 0, patch: 0).version,
        downloads: kReleaseDownloads,
        changelog: kStableChangelog);

    group("InnoSetupPatcherService", () {
      final innoSetupPatcherService = InnoSetupPatcherService(downloadService);

      test("canPatch should return true", () {
        expect(innoSetupPatcherService.canPatch, true);
      });

      test("getInstructions should not be supported", () {
        expect(
          innoSetupPatcherService.getInstructions(context, release),
          throwsUnsupportedError,
        );
      });
    });

    group("DmgPatcherService", () {
      final dmgPatcherService = DmgPatcherService(downloadService);

      test("canPatch should return true", () {
        expect(dmgPatcherService.canPatch, true);
      });

      test("getInstructions should not be supported", () {
        expect(
          dmgPatcherService.getInstructions(context, release),
          throwsUnsupportedError,
        );
      });
    });

    group("AppImagePatcherService", () {
      final appImagePatcherService = AppImagePatcherService();

      test("canPatch should return false", () {
        expect(appImagePatcherService.canPatch, false);
      });

      test("patch should not be supportedc", () {
        expect(
          appImagePatcherService.patch(release),
          throwsUnsupportedError,
        );
      });
    });

    group("SelfCompiledPatcherService", () {
      final selfCompiledPatcherService = SelfCompiledPatcherService();

      test("canPatch should return false", () {
        expect(selfCompiledPatcherService.canPatch, false);
      });

      test("patch should not be supportedc", () {
        expect(
          selfCompiledPatcherService.patch(release),
          throwsUnsupportedError,
        );
      });
    });
  });
}

class FakeBuildContext extends Fake implements BuildContext {}
