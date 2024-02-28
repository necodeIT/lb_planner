import 'package:lb_planner/features/auth/auth.dart';
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
/// If you want to query users, use [usersRepositoryProvider] instead.
final usersProvider = StateNotifierProvider<UsersRepository, List<User>>((ref) {
  final userDataSource = ref.watch(userDataSourceProvider);

  return UsersRepository(userDataSource);
});

/// Provides the repository for all users.
///
/// The repository exposes methods for querying and updating users.
///
/// If you only want to get a list of all users, use [usersProvider] instead.
final usersRepositoryProvider = usersProvider.notifier;
