import 'package:lb_planner/features/auth/auth.dart';
import 'package:lb_planner/shared/shared.dart';

/// Standard implementation of [UserDataSource].
class UserDataSourceImpl extends UserDataSource {
  /// The token to use for authentication.
  final UserToken userToken;

  /// The service to use for API calls.
  final ApiService apiService;

  /// Standard implementation of [UserDataSource].
  UserDataSourceImpl(this.apiService, this.userToken);

  @override
  Future<List<User>> fetchAllUsers() async {
    final response = await apiService.callFunction(
      function: "local_lbplanner_user_get_all_users",
      token: userToken.lbPlannerApiToken,
      body: {},
    );

    if (!response.isOk) {
      throw Exception("Failed to fetch users");
    }

    return List.from(response.expectMultiple())
        .map((e) => User.fromJson(e))
        .toList();
  }

  @override
  Future<User> fetchCurrentUser() async {
    var response = await apiService.callFunction(
      function: "local_lbplanner_user_get_user ",
      token: userToken.lbPlannerApiToken,
      body: {},
    );

    if (!response.isOk) {
      throw Exception("Failed to fetch current user");
    }

    return User.fromJson(response.expectSingle());
  }

  @override
  Future<User> updateUser(User user) async {
    var response = await apiService.callFunction(
      function: "local_lbplanner_user_update_user",
      token: userToken.lbPlannerApiToken,
      body: user.toJson(),
    );

    if (!response.isOk) {
      throw Exception("Failed to update user");
    }

    return User.fromJson(response.expectSingle());
  }
}
