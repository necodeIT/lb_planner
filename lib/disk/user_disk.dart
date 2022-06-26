part of lbplanner_engine;

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

    try {
      var json = await file.readAsString();

      var user = User.fromJson(jsonDecode(json));

      var response = await UserApi.getUser(user.token, user.id);

      _data = response.value ?? User.loading();
    } catch (e) {
      _data = User.loading();
    }
  }
}
