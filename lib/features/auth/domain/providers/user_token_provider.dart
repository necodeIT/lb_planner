import 'package:lb_planner/features/auth/auth.dart';
import 'package:lb_planner/features/auth/domain/providers/user_token_state.dart';
import 'package:riverpod/riverpod.dart';

/// Provides the current [UserToken]
///
/// If you want to log the user in or out, see [userTokenController].
final userTokenProvider =
    AsyncNotifierProvider<UserTokenState, UserToken>(() => UserTokenState());

/// Provides the controller for the current [UserToken]
///
/// Use this provider to log the user in or out.
///
/// If you only want to get the current user token, use [userTokenProvider] instead.
final userTokenController = userTokenProvider.notifier;
