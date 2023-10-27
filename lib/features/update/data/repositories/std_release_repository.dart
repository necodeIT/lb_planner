import 'package:lb_planner/features/update/update.dart';
import 'package:lb_planner/shared/domain/models/version.dart';
import 'package:lb_planner/configs/version.dart';

/// Standard implementation of [ReleaseRepository].
class StdReleaseRepository extends ReleaseRepository {
  /// The data source to use for fetching releases.
  final ReleaseDataSource dataSource;

  /// Standard implementation of [ReleaseRepository].
  StdReleaseRepository({required this.dataSource});

  @override
  Future<Map<BuildChannel, Release>> getAllReleases() =>
      dataSource.fetchReleases();
  @override
  Future<Release> getLatestRelease() => dataSource.fetchRelease(kBuildChannel);

  @override
  Future<bool> isUpdateAvailable() async {
    var latestRelease = await getLatestRelease();

    return latestRelease.version > kAppVersion;
  }
}
