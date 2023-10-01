import 'dart:async';

import 'package:lb_planner/features/auth/auth.dart';
import 'package:lb_planner/shared/shared.dart';
import 'package:riverpod/riverpod.dart';

/// Provides the currently logged in [User].
/// The user is inferred from the [UserToken] provided by [userTokenProvider] and will be updated automatically as changes occur.
///
/// Note: If the user is not logged in, this provider will return `null`.
///
/// If you want to update the user, use [userProvider] instead.
final userProvider = StateNotifierProvider<UserProvider, User?>((ref) {
  final userDataSource = ref.watch(userDataSourceProvider);

  return UserProvider(userDataSource);
});

/// Provides the repository for the currently logged in [User].
///
/// The repository provides methods for updating the user.
///
/// If you only want to get the current user, use [userProvider] instead.
final userRespositoryProvider = userProvider.notifier;

/// Provides the currently logged in [User].
/// The user is inferred from the [UserToken] provided by [userTokenProvider] and will be updated automatically as changes occur.
///
/// Note: If the user is not logged in, this provider will return `null`.
class UserProvider extends AutoRefreshStateNotifier<User?> {
  /// The data source to use.
  final UserDataSource userDataSource;

  /// Provides the currently logged in [User].
  /// The user is inferred from the [UserToken] provided by [userTokenProvider] and will be updated automatically as changes occur.
  ///
  /// Note: If the user is not logged in, this provider will return `null`.
  UserProvider(this.userDataSource) : super(null);

  @override
  FutureOr<User?> onRefresh() async {
    var user = await userDataSource.fetchCurrentUser();

    return user.validOrNull;
  }

  /// Updates the current user with the given [user] data.
  Future<void> updateUser(User user) async {
    var _user = await userDataSource.updateUser(user);

    state = _user.validOrNull;
  }
}
