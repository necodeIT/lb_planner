part of lbplanner_engine;

/// Provides the current user
final userProvider = StateNotifierProvider<UserProvider, User>((ref) => UserProvider());

/// Controller for the user.
final userController = userProvider.notifier;

/// Provides the current user
class UserProvider extends StateNotifier<User> {
  /// Provides the current user
  UserProvider() : super(User.loading());

  @override
  init() {
    if (UserDisk.data != null) setState(UserDisk.data!);
  }

  /// Performs a login request with the given [username] and [password].
  /// If the user is successfully logged in, the [state] will be updated.
  /// If the user was not registered, the user will be automatically registered.
  Future<RawApiResponse> login(String username, String password, {required Languages language, required String theme}) async {
    log("Trying to login user", LogTypes.tracking);

    var lpa = await UserApi.login(username, password);

    if (lpa.failed) return lpa;

    var moodleMobileApp = await Api.requestToken(password, username, ApiServices.moodle_mobile_app);

    if (moodleMobileApp.failed) return moodleMobileApp;

    var token = lpa.value!;
    var moodleToken = moodleMobileApp.value!;

    var id = await UserApi.getUserId(moodleToken);

    if (id.failed) return id;

    var user = await UserApi.getUser(token, id.value!);

    if (user.succeeded) {
      log("Logged in successfully", LogTypes.success);

      state = user.value!;
      UserDisk.saveUser(state);
      return user;
    }

    log("Registering user...", LogTypes.tracking);

    var register = await UserApi.registerUser(token, id.value!, language.name, theme);

    if (register.succeeded) {
      state = register.value!;
      UserDisk.saveUser(state);
    }

    log("Registered user successfully", LogTypes.success);

    return register;
  }

  /// Logs out the current user.
  Future<void> logout() async {
    log("Logging out user", LogTypes.tracking);
    state = User.loading();
    UserDisk.saveUser(state);
  }

  /// Updates the user's [User.theme] to [theme].
  Future<RawApiResponse> updateTheme(String theme) async {
    var response = await UserApi.updateUser(state.token, state.copyWith(theme: theme));

    if (response.succeeded) {
      state = response.value!;
      UserDisk.saveUser(state);
    }

    return response;
  }

  /// Updates the user's [User.displayTaskCount] to [displayTaskCount].
  Future<RawApiResponse> updateDisplayTaskCount(bool displayTaskCount) async {
    var response = await UserApi.updateUser(state.token, state.copyWith(displayTaskCount: displayTaskCount));

    if (response.succeeded) {
      state = response.value!;
      UserDisk.saveUser(state);
    }

    return response;
  }

  /// Updates the user's [User.language] to [language].
  Future<RawApiResponse> updateLanguage(Languages language) async {
    var response = await UserApi.updateUser(state.token, state.copyWith(language: language));

    if (response.succeeded) {
      state = response.value!;
      UserDisk.saveUser(state);
    }

    return response;
  }

  /// Deletes the user.
  Future<RawApiResponse> deleteUser() async {
    var response = await UserApi.deleteUser(state.token, state.id);

    if (response.succeeded) {
      state = User.loading();
      UserDisk.saveUser(state);
    }

    return response;
  }
}
