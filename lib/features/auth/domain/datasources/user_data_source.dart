import 'package:lb_planner/features/auth/auth.dart';
import 'package:lb_planner/shared/shared.dart';

/// Bser class for all data sources for [User]s.
abstract class UserDataSource extends DataSource {
  /// Initializes a new instance of [UserDataSource] with logging set up.
  UserDataSource() : super("User");

  /// Fetches the current user.
  Future<User> fetchCurrentUser();

  /// Fetches all users.
  Future<List<User>> fetchAllUsers();

  /// Sends the [user] to the server and returns the updated [User] from the server.
  Future<User> updateUser(User user);

  /// Deletes the user from the server.
  Future<void> deleteUser(User user);
}
