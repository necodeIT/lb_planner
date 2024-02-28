import 'package:lb_planner/features/update/update.dart';
import 'package:lb_planner/shared/shared.dart';
import 'package:lb_planner/configs/endpoints.dart';

/// Standard implementation of [ReleaseDataSource].
class StdReleaseDataSource extends ReleaseDataSource {
  /// The network service to use for fetching releases.
  final NetworkService networkService;

  /// Standard implementation of [ReleaseDataSource].
  StdReleaseDataSource({required this.networkService});

  @override
  Future<Release> fetchRelease(BuildChannel channel) async {
    log("Fetching latest release for $channel");

    var response = await networkService
        .get("$kLBPlannerWebsiteAdress/api/get_app_versions.php");

    if (response.isNotOk) {
      log("Failed to fetch release for $channel", response.body);

      throw Exception("Failed to fetch release: ${response.statusCode}");
    }

    var json = response.body as JSON;

    var channelRelease = json[channel.name] as JSON?;

    if (channelRelease == null) {
      log("Failed to fetch release for $channel: No release for channel");

      throw Exception("Failed to fetch release: No release for channel");
    }

    /// Add the channel name to the release JSON for parsing.
    channelRelease["channel"] = channel.name;

    log("Fetched latest release for $channel");

    return Release.fromJson(channelRelease);
  }

  @override
  Future<Map<BuildChannel, Release>> fetchReleases() async {
    log("Fetching latest releases for all channels");

    var response = await networkService
        .get("$kLBPlannerWebsiteAdress/api/get_app_versions.php");

    if (response.isNotOk) {
      log("Failed to fetch releases", response.body);

      throw Exception("Failed to fetch releases: ${response.statusCode}");
    }

    var json = response.body as JSON;

    var releases = <BuildChannel, Release>{};

    for (var entry in json.entries) {
      var channel = BuildChannel.values.byName(entry.key);

      var body = entry.value as JSON;

      /// Add the channel name to the release JSON for parsing.
      body["channel"] = channel.name;

      var release = Release.fromJson(body);
      releases[channel] = release;
    }

    log("Fetched latest releases for all channels");

    return releases;
  }
}
