part of lbplanner_helpers;

/// Current updater read only.
/// For updating use [updaterProvider].
final kUpdater = Updater();

/// Provider for updating the app.
final updaterProvider = ChangeNotifierProvider((ref) => UpdateProvider());

/// Provider for updating the app.
class UpdateProvider extends ChangeNotifier {
  UpdateStatus _status = UpdateStatus.idle;
  int _progress = 0;

  /// Whether a new update is available.
  bool get updateAvailable => kUpdater.updateAvailable;

  /// The url to download the update from.
  String get downloadUrl => kUpdater.setupDownloadUrl;

  /// The version of the update.
  String get latestVersionName => kUpdater.latestVersionName;

  /// The name of the current version
  String get versionName => "Alpha v${kUpdater.currentVersion}";

  /// The status of the update.
  UpdateStatus get status => _status;

  /// The progress of the update.
  int get progress => _progress;

  _updateProgress(int p0, int p1) {
    int progress = (p0 / p1 * 100).floor();
    if (progress == _progress) return;
    _progress = progress;

    notifyListeners();
  }

  _upgradeLinux(VoidCallback onError) {
    /// ! WIP !
    /// TODO: Adapt to appimage
    var src = "/home/ubuntu/Desktop/bundle";
    var current = "/home/ubuntu/Desktop/lb_planner/build/linux/x64/debug/bundle";
    var target = "/home/ubuntu/Desktop/lb_planner/build/linux/x64/debug";

    var cDir = Directory(current);

    cDir.deleteSync(recursive: true);

    cDir.createSync();

    var path = "$current/upgrade.sh";

    var content = "#! /bin/bash\ncp -r '$src' '$target'\nkill $pid\ncd $current\n./lb_planner\nrm ${r"$"}0";

    var f = File(path);
    f.createSync();

    f.writeAsStringSync(content);

    Process.start("chmod", ["+x", path]);

    Process.start(path, []);
  }

  /// Updates the app.
  void upgrade(VoidCallback onError) async {
    if (status.isDownloading || status.isDone || status.isError) return;

    _status = UpdateStatus.downloading;
    notifyListeners();

    // TODO: _upgradeLinux(onError);

    var f = await kUpdater.upgrade(_updateProgress);

    _status = await f.exists() ? UpdateStatus.done : UpdateStatus.error;

    notifyListeners();

    if (_status.isError) {
      onError();
    } else {
      await Future.delayed(kSlowAnimationDuration);
      await Process.start(f.path, []);
      exit(0);
    }
  }

  /// Checks for updates.
  Future<void> checkUpdates(String token) async {
    var response = await PluginConfigApi.getVersion(token);

    gPluginVersion = response.value;

    await kUpdater.update();

    notifyListeners();
  }
}

/// Status of the update.
enum UpdateStatus {
  /// The updated failed.
  error,

  /// The update is downloading.
  downloading,

  /// The update is done.
  done,

  /// The update is idle.
  idle,
}

/// Extension for [UpdateStatus].
extension UpdateStatusExt on UpdateStatus {
  /// Whether the update is downloading.
  bool get isDownloading => this == UpdateStatus.downloading;

  /// Whether the update is done.
  bool get isDone => this == UpdateStatus.done;

  /// Whether the update resulted in an error.
  bool get isError => this == UpdateStatus.error;

  /// Whether the kUpdater is idle.
  bool get isIdle => this == UpdateStatus.idle;
}

/// Updater for the app.
class Updater extends GitHubUpdater {
  @override
  String get appName => "LB Planner";

  @override
  String get currentVersion => "0.0.0";

  @override
  String get linuxFileName => throw UnimplementedError("Linux is not supported yet");

  @override
  String get macFileName => throw UnimplementedError("Mac is not supported yet");

  @override
  String get repo => "lb_planner";

  @override
  String get repoOwner => "necodeIT";

  @override
  String get windowsFileName => "Setup.exe";

  @override
  bool get updateAvailable => false;

  @override
  Future<bool> update() async {
    return true;
    if (gPluginVersion == null) {
      log("Failed checking for updates because plugin version is unkown!", LogTypes.error);
      return false;
    }

    var gh = await super.update();

    if (!gh) return false;

    var l = Version.fromString(latestVersion);

    return gPluginVersion!.majorVersion >= l.majorVersion;
  }
}

/// The current version of the plugin.
Version? gPluginVersion;
