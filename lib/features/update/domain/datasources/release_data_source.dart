import 'package:lb_planner/features/update/update.dart';
import 'package:lb_planner/shared/shared.dart';

/// Base class for all release data sources.
abstract class ReleaseDataSource {
  /// Fetches all releases for all build channels.
  /// Returns a map of [BuildChannel] to [Release].
  Future<Map<BuildChannel, Release>> fetchReleases();

  /// Fetches the latest release for a given build channel.
  Future<Release> fetchRelease(BuildChannel channel);
}
