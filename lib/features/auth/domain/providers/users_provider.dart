import 'dart:async';

import 'package:lb_planner/features/auth/auth.dart';
import 'package:lb_planner/shared/shared.dart';
import 'package:riverpod/riverpod.dart';

/// Provides a list of all users.
///
/// Note: Unless the current user has [UserCapability.dev] or [UserCapability.moderator], some information about other users will be redacted:
///
/// - [User.themeName]
/// - [User.language]
/// - [User.capabilitiesBitMask]
/// - [User.capabilities]
/// - [User.locale]
/// - [User.planId]
/// - [User.colorBlindness]
/// - [User.colorBlindnessString]
/// - [User.displayTaskCount]
/// - [User.displayTaskCountInt]
///
/// If you want to query users, use [usersRespositoryProvider] instead.
final usersProvider = StateNotifierProvider<UsersProvider, List<User>>((ref) {
  final userDataSource = ref.watch(userDataSourceProvider);

  return UsersProvider(userDataSource);
});

/// Provides the repository for all users.
///
/// The repository provides methods for querying and updating users.
///
/// If you only want to get a list of all users, use [usersProvider] instead.
final usersRespositoryProvider = usersProvider.notifier;

/// Provides a list of all users.
///
/// Note: Unless the current user has [UserCapability.dev] or [UserCapability.moderator], some information about other users will be redacted:
///
/// - [User.themeName]
/// - [User.language]
/// - [User.capabilitiesBitMask]
/// - [User.capabilities]
/// - [User.locale]
/// - [User.planId]
/// - [User.colorBlindness]
/// - [User.colorBlindnessString]
/// - [User.displayTaskCount]
/// - [User.displayTaskCountInt]
///
/// Additionally provides methods for querying users.
class UsersProvider extends AutoRefreshStateNotifier<List<User>> {
  /// The data source to use.
  final UserDataSource userDataSource;

  /// Provides a list of all users.
  ///
  /// Also provides methods for querying users.
  UsersProvider(this.userDataSource) : super([]);

  @override
  FutureOr<List<User>> onRefresh() {
    return userDataSource.fetchAllUsers();
  }

  /// Searches for users with the given [query].
  ///
  /// The [query] is matched against the [User.username], [User.firstname], [User.lastname] and [User.vintage].
  List<User> searchUsers(String query) {
    return state
        .where(
          (user) =>
              user.username.containsIgnoreCase(query) ||
              user.firstname.containsIgnoreCase(query) ||
              user.lastname.containsIgnoreCase(query) ||
              user.vintage.containsIgnoreCase(query),
        )
        .toList();
  }

  /// Returns the user with the given [id].
  ///
  /// Returns `null` if no user with the given [id] exists.
  User? findUserById(int id) {
    return state.firstWhereOrNull((user) => user.id == id);
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
    return state.where((user) {
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
  }
}
