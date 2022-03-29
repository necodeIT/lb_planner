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

/// Provides utilities to remap parameters as the moodle api and the models have different names for their parameters.
extension UserMappingExtensions on Map<String, dynamic> {
  /// Maps paramters from to fit [User.fromJson].
  Map<String, dynamic> mapUser() {
    var body = Map.of(this);
    body["language"] = this["lang"];
    body["accessLevel"] = AccessLevels.values[this["role"]].toString().split(".").last;
    body["id"] = this["userid"];
    body["avatar"] = this["profileimageurl"];
    body["planId"] = this["planid"];

    return body;
  }
}
