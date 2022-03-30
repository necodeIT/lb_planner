part of lbplanner_api;

/// Provides the current user
class UserProvider extends StateNotifier<User> {
  /// Provides the current user
  UserProvider() : super(User.empty());

  /// Performs a login request with the given [username] and [password]
  // Future<RawApiResponse> login(String username, String password) async {
  //   var lpa = await UserApi.login(username, password);
  //   var moodleMobileApp = await Api.requestToken(password, username, ApiServices.moodle_mobile_app);

  //   if (lpa.failed) return RawApiResponse(lpa.response);
  //   if (moodleMobileApp.failed) return moodleMobileApp;

  //   var token = lpa.value!;
  //   var moodleToken = moodleMobileApp["token"]!;

  //   var id = await UserApi.getUserId(moodleToken);

  //   if (id.failed) return RawApiResponse(id.response);

  //   var user = await UserApi.getUser(token, id.value!);
  // }
}
