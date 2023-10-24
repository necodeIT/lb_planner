import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lb_planner/features/update/data/data.dart';
import '../../config.dart';
import 'package:lb_planner/shared/data/data.dart';
import 'package:lb_planner/shared/shared.dart';

void main() {
  group("ReleaseDataSource", () {
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

    test("fetchRelease(BuildChannel.stable) should return stable release",
        () async {
      var release = await releaseDataSource.fetchRelease(BuildChannel.stable);

      expect(release.channel, BuildChannel.stable);
      expect(
        release.version,
        Version(
          major: 1,
          minor: 0,
          patch: 0,
        ),
      );
      expect(release.downloads, kReleaseDownloads);
    });

    test("fetchRelease(BuildChannel.beta) should return beta release",
        () async {
      var release = await releaseDataSource.fetchRelease(BuildChannel.beta);

      expect(release.channel, BuildChannel.beta);
      expect(
        release.version,
        Version(
          major: 1,
          minor: 0,
          patch: 3,
        ),
      );
      expect(release.downloads, kReleaseDownloads);
    });

    test("fetchRelease(BuildChannel.dev) should return alpha release",
        () async {
      var release = await releaseDataSource.fetchRelease(BuildChannel.dev);

      expect(release.channel, BuildChannel.dev);
      expect(
        release.version,
        Version(
          major: 1,
          minor: 1,
          patch: 0,
          build: 3,
        ),
      );
      expect(release.downloads, kReleaseDownloads);
    });

    test("fetchReleases should return all releases", () async {
      var releases = await releaseDataSource.fetchReleases();

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
  });
}
