import 'package:lb_planner/features/auth/auth.dart';
import 'package:lb_planner/shared/shared.dart';

/// Standard implementation of [UserDataSource].
class StdUserDataSource extends UserDataSource {
  /// The token to use for authentication.
  final UserToken userToken;

  /// The service to use for API calls.
  final ApiService apiService;

  /// Standard implementation of [UserDataSource].
  StdUserDataSource(this.apiService, this.userToken);

  @override
  Future<List<User>> fetchAllUsers() async {
    log("Fetching all users...");

    final response = await apiService.callFunction(
      function: "local_lbplanner_user_get_all_users",
      token: userToken.lbPlannerApiToken,
      body: {},
    );

    if (response.failed) {
      log("Failed to fetch users.", response.body);

      throw Exception("Failed to fetch users");
    }

    final users = List.from(response.expectMultiple())
        .map((e) => User.fromJson(e))
        .toList();

    log("Fetched ${users.length} users.");

    return users;
  }

  @override
  Future<User> fetchCurrentUser() async {
    log("Fetching current user...");

    var response = await apiService.callFunction(
      function: "local_lbplanner_user_get_user",
      token: userToken.lbPlannerApiToken,
      body: {},
    );

    if (response.failed) {
      log(
        "Failed to fetch current user. Is the user logged in?",
        response.body,
      );

      throw Exception("Failed to fetch current user");
    }

    log("Fetched current user.");

    return User.fromJson(response.expectSingle());
  }

  @override
  Future<User> updateUser(User user) async {
    log("Updating user...");

    var response = await apiService.callFunction(
      function: "local_lbplanner_user_update_user",
      token: userToken.lbPlannerApiToken,
      body: {
        "colorblindness": user.colorBlindnessString,
        "lang": user.language,
        "theme": user.themeName,
        "displaytaskcount": user.displayTaskCountInt,
      },
    );

    if (response.failed) {
      log(
        "Failed to update user. Does the user have the necessary permissions?",
        response.body,
      );

      throw Exception("Failed to update user");
    }

    log("Updated user sucessfully.");

    return User.fromJson(response.expectSingle());
  }

  @override
  Future<void> deleteUser(User user) async {
    log("Deleting user...");

    var response = await apiService.callFunction(
      function: "local_lbplanner_user_delete_user",
      token: userToken.lbPlannerApiToken,
      body: {
        "userid": user.id,
      },
    );

    if (response.failed) {
      log(
        "Failed to delete user. Does the user have the necessary permissions?",
        response.body,
      );

      throw Exception("Failed to delete user");
    }
  }
}
