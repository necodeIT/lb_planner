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
}
