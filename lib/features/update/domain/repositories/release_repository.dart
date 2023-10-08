import 'package:lb_planner/features/update/update.dart';
import 'package:lb_planner/shared/shared.dart';

/// Repository interface for fetching releases information.
abstract class ReleaseRepository {
  /// Returns the latest release available.
  Future<Release> getLatestRelease();

  /// Returns all releases available, grouped by build channel.
  Future<Map<BuildChannel, Release>> getAllReleases();

  /// Returns `true` if an update is available for the current build channel and false otherwise.
  Future<bool> isUpdateAvailable();
}
