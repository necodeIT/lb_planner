import 'package:lb_planner/features/auth/auth.dart';
import 'package:riverpod/riverpod.dart';

/// Provides the current [UserToken]
///
/// If you want to log the user in or out, see [userTokenRepositoryProvider].
final userTokenProvider = AsyncNotifierProvider<UserTokenRepository, UserToken>(
  () => UserTokenRepository(),
);

/// Provides [UserTokenRepository] for managing the user's token.
///
/// If you only want to get the current user token, use [userTokenProvider] instead.
final userTokenRepositoryProvider = userTokenProvider.notifier;
