import 'package:lb_planner/features/update/update.dart';
import 'package:lb_planner/shared/shared.dart';
import 'package:lb_planner/configs/endpoints.dart';

/// Standard implementation of [ReleaseDataSource].
class StdReleaseDataSource extends ReleaseDataSource {
  /// The network service to use for fetching releases.
  final NetworkService<JSON> networkService;

  /// Standard implementation of [ReleaseDataSource].
  StdReleaseDataSource({required this.networkService});

  @override
  Future<Release> fetchRelease(BuildChannel channel) async {
    var response =
        await networkService.get("$kLBPlannerWebsiteAdress/api/releases");

    if (response.isNotOk) {
      throw Exception("Failed to fetch release: ${response.statusCode}");
    }

    var json = response.body;

    var channelRelease = json![channel.name] as JSON?;

    if (channelRelease == null) {
      throw Exception("Failed to fetch release: No release for channel");
    }

    /// Add the channel name to the release JSON for parsing.
    channelRelease["channel"] = channel.name;

    return Release.fromJson(channelRelease);
  }

  @override
  Future<Map<BuildChannel, Release>> fetchReleases() async {
    var response =
        await networkService.get("$kLBPlannerWebsiteAdress/api/releases");

    if (response.isNotOk) {
      throw Exception("Failed to fetch releases: ${response.statusCode}");
    }

    var json = response.body;

    var releases = <BuildChannel, Release>{};

    for (var entry in json!.entries) {
      var channel = BuildChannel.values.byName(entry.key);

      var body = entry.value as JSON;

      /// Add the channel name to the release JSON for parsing.
      body["channel"] = channel.name;

      var release = Release.fromJson(body);
      releases[channel] = release;
    }

    return releases;
  }
}
