import 'package:lb_planner/shared/shared.dart';
import 'package:riverpod/riverpod.dart';

import 'package:lb_planner/features/auth/auth.dart';
import 'package:lb_planner/features/auth/data/data.dart';

/// Provides the current [UserDataSource] instance.
final userDataSourceProvider = Provider<UserDataSource>((ref) {
  final token = ref.watch(userTokenProvider);
  final apiService = ref.watch(apiServiceProvider);

  return token.when(
    data: (token) => UserDataSourceImpl(apiService, token),
    loading: () => TokenUnavailableUserDataSource(reason: "Token is loading"),
    error: (error, stackTrace) => TokenUnavailableUserDataSource(
      reason: "User is not logged in",
      error: error,
      stackTrace: stackTrace,
    ),
  );
});
