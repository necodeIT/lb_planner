part of lbplanner_engine;

/// Contains information for data storage.
class Disk {
  /// The name of the folder where the user data is stored.
  static const appFolderName = "LB Planner";

  /// The folder where the user data is stored.
  static Future<Directory> get appDir async {
    var dir = await getApplicationDocumentsDirectory();

    var path = '${dir.path}/$appFolderName';

    if (kDebugMode) path += "/debug";

    var appDir = Directory(path);

    await appDir.create();

    return appDir;
  }
}
