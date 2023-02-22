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
  static const Version currentVersion = Version(majorVersion: 0, minorVersion: 0, patchVersion: 0);

  /// The current version prefix of the app.
  static final String currentVersionName = "Open Beta v$currentVersion";

  /// The name of the file to download when updating the app.
  String get installerFileName;

  /// Checks for updates and returns information about the latest update.
  @nonVirtual
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

  /// Returns a [File] object for the file specified in [installerFileName].
  ///
  /// Does not check if the file exists.
  Future<File> getInstallerFile() async {
    var dir = await getTemporaryDirectory();

    return File("${dir.path}/$installerFileName");
  }

  /// Downloads the file specified in [installerFileName] from the url specified in [info] assets.
  ///
  /// Returns a stream of [UpdateStatus] with the download progress.
  ///
  /// Returns a stream of [UpdateStatus] with [DownloadStatus.error] if the file does not exist on the remote server.
  Stream<UpdateStatus> download(Update info) async* {
    if (!info.updateAvailable) return;

    var status = info.toUpdateStatus().copyWith(fileName: installerFileName);

    if (!info.assets.containsKey(installerFileName)) {
      yield status.copyWith(downloadStatus: DownloadStatus.error, error: "Installer file not found on remote server.");

      return;
    }

    var client = http.Client();

    var request = http.Request("GET", Uri.parse(info.assets[status.fileName]!));

    var response = await client.send(request);

    var total = response.contentLength;

    var bytes = <int>[];

    await for (var chunk in response.stream) {
      bytes.addAll(chunk);

      var progress = (bytes.length / (total ?? bytes.length / 2) * 100).round();

      yield status.copyWith(progress: progress, downloadStatus: DownloadStatus.downlaoding);
    }

    var file = await getInstallerFile();

    await file.writeAsBytes(bytes);

    yield status.copyWith(downloadStatus: DownloadStatus.installing);
  }

  /// Checks if hte installer file downloaded via [download] exists.
  ///
  /// Returns [status] with [DownloadStatus.error] if the file does not exist.
  ///
  /// Returns [status] if the file exists.
  Future<UpdateStatus> checkFile(UpdateStatus status) async {
    var file = await getInstallerFile();

    if (status.downloadStatus == DownloadStatus.error || !file.existsSync()) return status.copyWith(downloadStatus: DownloadStatus.error, error: "Failed to download file.");

    return status;
  }

  /// Downloads and installs the latest update given by [updateInfo].
  ///
  /// Overwrite this method to implement your own upgrade logic.
  Stream<UpdateStatus> upgrade(Update info) async* {
    if (!info.updateAvailable) return;

    var status = info.toUpdateStatus();

    await for (status in download(info)) {
      yield status;
    }

    if (status.downloadStatus == DownloadStatus.error) return;

    yield status = await checkFile(status);

    if (status.downloadStatus == DownloadStatus.error) return;
    
    await for (status in install(status)){
      yield status
    }
  }

  /// Installs the update (called by [upgrade] unless [upgrade] was overwridden).
  ///
  /// Overwrite this method to implement your own installation logic.
  Stream<UpdateStatus> install(UpdateStatus status) async* {
    yield status = await checkFile(status);

    if (status.downloadStatus == DownloadStatus.error) return;

    yield status = status.copyWith(downloadStatus: DownloadStatus.installing);

    var f = await getInstallerFile();

    await Process.start(f.path, []);

    exit(0);
  }
}

/// Converts an [Update] to an [UpdateStatus].
extension UpdateToUpdateStatus on Update {
  /// Converts an [Update] to an [UpdateStatus].
  UpdateStatus toUpdateStatus() {
    return UpdateStatus(
      updateAvailable: updateAvailable,
      latestVersionName: remoteVersionName,
      patchNotes: patchNotes,
    );
  }
}
