import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lb_planner/configs/version.dart';
import 'package:lb_planner/features/update/data/data.dart';
import 'package:lb_planner/shared/data/data.dart';
import 'package:lb_planner/shared/shared.dart';

void main() {
  group("ReleaseRepository", () {
    final dio = Dio(
      BaseOptions(
        // so Dio doesn't throw on non success status codes
        validateStatus: (_) => true,
      ),
    );
    final networkService = DioNetworkService(dio);

    final releaseDataSource = StdReleaseDataSource(
      networkService: networkService,
    );

    final releaseRepository = StdReleaseRepository(
      dataSource: releaseDataSource,
    );

    test("getAllReleases should return all releases", () async {
      var releases = await releaseRepository.getAllReleases();

      expect(
        releases[BuildChannel.beta],
        isNotNull,
        reason: "beta release should be present",
      );
      expect(
        releases[BuildChannel.stable],
        isNotNull,
        reason: "stable release should be present",
      );
      expect(
        releases[BuildChannel.dev],
        isNotNull,
        reason: "dev release should be present",
      );
    });

    test(
        "getLatestRelease should return latest release for current build channel",
        () async {
      var release = await releaseRepository.getLatestRelease();

      expect(release.channel, kBuildChannel);
    });

    test("isUpdateAvailable should return true", () async {
      var isUpdateAvailable = await releaseRepository.isUpdateAvailable();

      expect(
        isUpdateAvailable,
        true,
        reason: "current version is ${kAppVersion.version}",
      );
    });
  });
}
