import 'package:lb_planner/features/auth/auth.dart';
import 'package:riverpod/riverpod.dart';

/// Provides the currently logged in [User].
/// The user is inferred from the [UserToken] provided by [userTokenProvider] and will be updated automatically as changes occur.
///
/// Note: If the user is not logged in, this provider will return `null`.
///
/// If you want to update the user, use [userRepositoryProvider] instead.
///
/// If you want to login the user, see [userTokenRepositoryProvider].
final userProvider = StateNotifierProvider<UserRepository, User?>((ref) {
  final userDataSource = ref.watch(userDataSourceProvider);

  return UserRepository(userDataSource);
});

/// Provides [UserRepository] for managing the user.
///
/// If you only want to get the current user, use [userProvider] instead.
final userRepositoryProvider = userProvider.notifier;
