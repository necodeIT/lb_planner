part of lbplanner_api;

/// Provides the current user
final userProvider = Provider((ref) => UserProvider());

/// Provides the current user
class UserProvider extends StateNotifier<User> {
  /// Provides the current user
  UserProvider() : super(User.empty());

  /// Performs a login request with the given [username] and [password].
  /// If the user is successfully logged in, the [User] is updated.
  /// If the user was not registered, the user will be automatically registered.
  Future<RawApiResponse> login(String username, String password, {required Languages language, required String theme}) async {
    var lpa = await UserApi.login(username, password);
    var moodleMobileApp = await Api.requestToken(password, username, ApiServices.moodle_mobile_app);

    if (lpa.failed) return RawApiResponse(lpa.response);
    if (moodleMobileApp.failed) return moodleMobileApp;

    var token = lpa.value!;
    var moodleToken = moodleMobileApp["token"]!;

    var id = await UserApi.getUserId(moodleToken);

    if (id.failed) return RawApiResponse(id.response);

    var user = await UserApi.getUser(token, id.value!);

    if (user.succeeded) {
      assert(!user.value!.restricted);
      assert(!user.value!.isEmpty);

      state = user.value!;
      return RawApiResponse(user.response);
    }

    var register = await UserApi.registerUser(token, id.value!, language.name, theme);

    if (register.succeeded) state = register.value!;

    return RawApiResponse(register.response);
  }

  /// Logs out the current user.
  void logout() {
    state = User.empty();
  }
}
