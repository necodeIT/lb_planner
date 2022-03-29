part of lbplanner_api;

/// Provides api methods for user functions.
class UserApi {
  /// Get the data for a user
  static Future<ApiResponse<User>> getUser(String token, int userId) async {
    var response = await Api.makeRequest(
      functionName: "local_lbplanner_user_get_user",
      token: token,
      params: {"userid": userId},
    );

    User? user;

    if (response.succeeded) {
      user = User.fromJson(response.body.mapUser());
    }

    return ApiResponse(response.response, user);
  }

  ///Register a new user in the lbplanner app.
  static Future<ApiResponse<User>> registerUser(String token, int userId, String lang, String theme) async {
    var response = await Api.makeRequest(
      functionName: "local_lbplanner_user_register_user",
      token: token,
      params: {
        "userid": userId,
        "lang": lang,
        "theme": theme,
      },
    );

    User? user;

    if (response.succeeded) {
      user = User.fromJson(response.body.mapUser());
    }

    return ApiResponse(response.response, user);
  }

  /// Requests a token for the given [username] and [password].
  static Future<ApiResponse<String>> login(String username, String password) async {
    var response = await Api.requestToken(password, username);

    return ApiResponse(response.response, response["token"]);
  }
}
