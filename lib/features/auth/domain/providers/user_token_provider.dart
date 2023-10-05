import 'package:lb_planner/features/auth/auth.dart';
import 'package:lb_planner/features/auth/domain/providers/user_token_state.dart';
import 'package:riverpod/riverpod.dart';

/// Provides the current [UserToken]
final userTokenProvider =
    AsyncNotifierProvider<UserTokenState, UserToken>(() => UserTokenState());
