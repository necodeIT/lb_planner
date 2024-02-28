import 'dart:async';

import 'package:lb_planner/features/auth/auth.dart';
import 'package:lb_planner/shared/shared.dart';

/// Repository responsible for managing the currently logged in [User].
///
/// See [userProvider] and [userRepositoryProvider] for usage.
class UserRepository extends AutoRefreshStateNotifier<User?>
    with RepositoryMixin {
  /// The data source to use.
  final UserDataSource userDataSource;

  /// Provides the currently logged in [User].
  /// The user is inferred from the [UserToken] provided by [userTokenProvider] and will be updated automatically as changes occur.
  ///
  /// Note: If the user is not logged in, this provider will return `null`.
  UserRepository(this.userDataSource) : super(null);

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

  /// Deletes the current user.
  ///
  /// As a result, the user will be logged out and [state] will be set to `null`.
  Future<void> deleteUser() async {
    await userDataSource.deleteUser(state!);

    state = null;
  }
}
