part of lbplanner_engine;

/// Service for checking for updates and installing them.
abstract class UpdaterService {
  /// The owner of the repository that contains the app.
  static const String repoOwner = "necodeIT";

  /// The name of the repository that contains the app.
  static const String repoName = "lb_planner";

  /// The url to the GitHub api of the repository that contains the app.
  static const String repoApiUrl = "https://api.github.com/repos/$repoOwner/$repoName";

  /// The current version of the app.
  static const Version currentVersion = Version(majorVersion: 0, minorVersion: 0, patchVersion: 2);

  /// The current version prefix of the app.
  static final String currentVersionName = "Open Beta v$currentVersion";

  /// Checks for updates and returns information about the latest update.
  Future<Update> checkForUpdates(Version pluginVersion) async {
    var response = await http.get(Uri.parse("$repoApiUrl/releases"));

    if (response.statusCode != 200) return Update();

    var releases = jsonDecode(response.body) as List;

    if (releases.isEmpty) return Update();

    // find first release that is not a pre-release and is based of app branch

    var latestRelease = releases.firstWhere((release) => !release["prerelease"] && release["target_commitish"] == "app", orElse: () => null);

    if (latestRelease == null) return Update();

    var tagNameWithoutPrefix = latestRelease["tag_name"].toString().replaceFirst("f", "");

    var latestVersion = Version.fromString(tagNameWithoutPrefix);

    // plugin minor version must be equal or higher than latest release minor version
    if (pluginVersion.minorVersion < latestVersion.minorVersion) return Update();

    // plugin major version must be equal to latest release major version
    if (pluginVersion.majorVersion != latestVersion.majorVersion) return Update();

    // latest version must be higher than current version
    if (latestVersion <= currentVersion) return Update();

    var rawAssets = latestRelease["assets"] as List;

    UpdateAssets assets = {
      for (var asset in rawAssets) asset["name"].toString(): asset["browser_download_url"].toString(),
    };

    return Update(
      updateAvailable: true,
      remoteVersion: tagNameWithoutPrefix,
      patchNotes: latestRelease["body"].toString(),
      remoteVersionName: latestRelease["name"].toString(),
      assets: assets,
    );
  }

  /// Downloads and installs the latest update given by [updateInfo].
  Stream<Update> upgrade(Update info) async* {}
}
