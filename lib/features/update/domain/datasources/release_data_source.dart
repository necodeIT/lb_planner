import 'package:lb_planner/features/update/update.dart';
import 'package:lb_planner/shared/shared.dart';

/// Base class for all release data sources.
abstract class ReleaseDataSource extends DataSource {
  /// Initializes a new instance of [ReleaseDataSource] with logging set up.
  ReleaseDataSource() : super("Release");

  /// Fetches all releases for all build channels.
  /// Returns a map of [BuildChannel] to [Release].
  Future<Map<BuildChannel, Release>> fetchReleases();

  /// Fetches the latest release for a given build channel.
  Future<Release> fetchRelease(BuildChannel channel);
}
