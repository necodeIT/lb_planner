import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lb_planner/features/update/data/data.dart';
import '../../config.dart';
import 'package:lb_planner/shared/data/data.dart';
import 'package:lb_planner/shared/shared.dart';

const String kStableChangelog = '''
## Version 1.0.0 (Stable)
- **Initial release** of the application.
- Implemented core functionalities and features.
- Bug fixes and performance improvements from the alpha version.''';

const String kBetaChangelog = '''
## Version 1.0.3 (Beta)
- **Enhancements** to the user interface, making it more intuitive.
- Added support for additional file formats.
- Fixed minor bugs reported by the community.
- Improved stability in various modules.''';

const String kDevChangelog = '''
## Version 1.1.0+3 (Dev)
- **New Feature**: Integration with third-party APIs.
- **UI Updates**: Introduced dark mode.
- Fixed memory leak issues observed in the previous builds.
- **Performance**: Optimized database queries for faster data retrieval.
- Under the hood improvements for developers.''';

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
      expect(release.changelog, kStableChangelog);
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
      expect(release.changelog, kBetaChangelog);
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
      expect(release.changelog, kDevChangelog);
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
