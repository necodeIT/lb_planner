import 'dart:async';

import 'package:lb_planner/features/auth/auth.dart';
import 'package:lb_planner/shared/shared.dart';

/// Repository responsible for managing all users.
///
/// See [usersProvider] and [usersRepositoryProvider] for usage.
class UsersRepository extends AutoRefreshStateNotifier<List<User>>
    with RepositoryMixin {
  /// The data source to use.
  final UserDataSource userDataSource;

  /// Provides a list of all users.
  ///
  /// Also provides methods for querying users.
  UsersRepository(this.userDataSource) : super([]);

  @override
  FutureOr<List<User>> onRefresh() {
    return userDataSource.fetchAllUsers();
  }

  /// Searches for users with the given [query].
  ///
  /// The [query] is matched against the [User.username], [User.firstname], [User.lastname] and [User.vintage].
  List<User> searchUsers(String query) {
    log('Searching for users matching $query');

    final result = state
        .where(
          (user) =>
              user.username.containsIgnoreCase(query) ||
              user.firstname.containsIgnoreCase(query) ||
              user.lastname.containsIgnoreCase(query) ||
              user.vintage.containsIgnoreCase(query),
        )
        .toList();

    log('Found ${result.length} users matching $query');

    return result;
  }

  /// Returns the user with the given [id].
  ///
  /// Returns `null` if no user with the given [id] exists.
  User? findUserById(int id) {
    log('Searching for user with id $id');

    final match = state.firstWhereOrNull((user) => user.id == id);

    if (match == null) {
      log('No user with id $id found');
    } else {
      log('Found user with id $id');
    }

    return match;
  }

  /// Filters the users by the given parameters.
  ///
  /// A user must match all given parameters to be included in the result.
  List<User> filterBy({
    String? username,
    String? firstname,
    String? lastname,
    String? vintage,
    List<UserCapability>? capabilities,
  }) {
    log('Filtering users by username: $username, firstname: $firstname, lastname: $lastname, vintage: $vintage, capabilities: $capabilities');

    final match = state.where((user) {
      bool matchesUsername =
          username == null || user.username.containsIgnoreCase(username);
      bool matchesFirstname =
          firstname == null || user.firstname.containsIgnoreCase(firstname);
      bool matchesLastname =
          lastname == null || user.lastname.containsIgnoreCase(lastname);
      bool matchesVintage =
          vintage == null || user.vintage.containsIgnoreCase(vintage);
      bool matchesCapabilities =
          capabilities == null || user.capabilities.has(capabilities);

      return matchesUsername &&
          matchesFirstname &&
          matchesLastname &&
          matchesVintage &&
          matchesCapabilities;
    }).toList();

    log("Found ${match.length} users");

    return match;
  }
}
