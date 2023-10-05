import 'package:lb_planner/features/auth/auth.dart';

/// Bser class for all data sources for [User]s.
abstract class UserDataSource {
  /// Fetches the current user.
  Future<User> fetchCurrentUser();

  /// Fetches all users.
  Future<List<User>> fetchAllUsers();

  /// Sends the [user] to the server and returns the updated [User] from the server.
  Future<User> updateUser(User user);
}
