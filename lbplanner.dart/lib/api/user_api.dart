part of lbplanner_api;

/// Provides api methods for user functions.
class UserApi {
  /// Get the data for a user
  static Future<ApiResponse<User>> getUser(String token, int userId) async {
    var response = await Api.makeRequest(
      functionName: "local_lbplanner_user_get_user",
      token: token,
      params: {"userid": userId},
      reportError: false,
    );

    User? user;

    if (response.succeeded) {
      user = User.fromJson(response.body.mapUser(token));
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
      user = User.fromJson(response.body.mapUser(token));
    }

    return ApiResponse(response.response, user);
  }

  ///Update a user in the lbplanner app.
  static Future<ApiResponse<User>> updateUser(String token, User data) async {
    var response = await Api.makeRequest(
      functionName: "local_lbplanner_user_update_user",
      token: token,
      params: {
        "userid": data.id,
        "lang": data.language.name,
        "theme": data.theme,
        "colorblindness": data.colorBlindness.name,
      },
    );

    User? user;

    if (response.succeeded) {
      user = User.fromJson(response.body.mapUser(token));
    }

    return ApiResponse(response.response, user);
  }

  /// Get all users from the lbplanner app.
  static Future<ApiResponse<List<User>>> getAllUsers(String token, int userId) async {
    var response = await Api.makeRequest(
      functionName: "local_lbplanner_user_get_all_users",
      token: token,
      params: {"userid": userId},
    );

    List<User>? users;

    if (response.succeeded) {
      users = [];
      for (var user in response[kApiListContent]) {
        var userMap = Map<String, dynamic>.from(user);

        users.add(User.fromJson(userMap.mapUser(token)));
      }
    }
    return ApiResponse(response.response, users);
  }

  ///Delete a user from the lbplanner app.
  static Future<RawApiResponse> deleteUser(String token, int userId) async {
    var response = await Api.makeRequest(
      functionName: "local_lbplanner_user_delete_user",
      token: token,
      params: {"userid": userId},
    );
    return response;
  }

  /// Requests a token for the given [username] and [password].
  static Future<ApiResponse<String>> login(String username, String password) => Api.requestToken(password, username, ApiServices.lpa);

  /// Retrieves the user id with the given [token].
  /// The [token] must have access to the [ApiServices.moodle_mobile_app] service.
  static Future<ApiResponse<int>> getUserId(String token) async {
    var response = await Api.makeRequest(
      functionName: "core_webservice_get_site_info",
      token: token,
    );

    return ApiResponse(response.response, response.body["userid"]);
  }
}
