part of lbplanner_api;

/// Provides the current user
final userProvider = StateNotifierProvider<UserProvider, User>((ref) => UserProvider());

/// Provides the current user
class UserProvider extends StateNotifier<User> {
  /// Provides the current user
  UserProvider() : super(User.empty());

  /// Performs a login request with the given [username] and [password].
  /// If the user is successfully logged in, the [User] is updated.
  /// If the user was not registered, the user will be automatically registered.
  Future<RawApiResponse> login(String username, String password, {required Languages language, required String theme}) async {
    log("Trying to login user", LogTypes.tracking);

    var lpa = await UserApi.login(username, password);
    var moodleMobileApp = await Api.requestToken(password, username, ApiServices.moodle_mobile_app);

    if (lpa.failed) return lpa;
    if (moodleMobileApp.failed) return moodleMobileApp;

    var token = lpa.value!;
    var moodleToken = moodleMobileApp["token"]!;

    var id = await UserApi.getUserId(moodleToken);

    if (id.failed) return id;

    var user = await UserApi.getUser(token, id.value!);

    if (user.succeeded) {
      assert(!user.value!.restricted);
      assert(!user.value!.isEmpty);

      log("Logged in successfully", LogTypes.success);

      state = user.value!;
      return user;
    }

    log("Registering user...", LogTypes.tracking);

    var register = await UserApi.registerUser(token, id.value!, language.name, theme);

    if (register.succeeded) state = register.value!;

    log("Registered user successfully", LogTypes.success);

    return register;
  }

  /// Logs out the current user.
  void logout() {
    log("Logging out user", LogTypes.tracking);
    state = User.empty();
  }
}
