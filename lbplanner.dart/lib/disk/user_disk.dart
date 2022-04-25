part of lbplanner_api;

/// Responsible for saving and loading the [User].
class UserDisk {
  static User? _data;

  /// The [User] that is currently logged in.
  static User? get data => _data;

  /// The name of the file where the [User] is stored.
  static const String userFileName = "user.json";

  /// The file where the [User] is stored.
  static Future<File> get userFile async {
    var dir = await Disk.appDir;

    var file = File('${dir.path}/$userFileName');

    return file;
  }

  /// Saves the [User] to the disk.
  static Future<void> saveUser(User user) async {
    var file = await userFile;

    var json = jsonEncode(user.toJson());

    await file.writeAsString(json);
  }

  /// Loads the [User] from the disk.
  static Future<void> loadUser() async {
    var file = await userFile;

    var json = await file.readAsString();

    try {
      _data = User.fromJson(jsonDecode(json));

      var response = await UserApi.getUser(data!.token, data!.id);

      assert(response.succeeded);
    } catch (e) {
      _data = User.empty();
    }
  }
}
