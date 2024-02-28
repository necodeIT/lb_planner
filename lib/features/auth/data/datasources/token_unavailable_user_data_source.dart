import 'package:lb_planner/features/auth/auth.dart';
import 'package:lb_planner/shared/utils/warn_mixin.dart';

/// Implementation of [UserDataSource] to use when no token is available.
///
/// This implementation will not throw any errors, but will return empty lists and default values instead.
class TokenUnavailableUserDataSource extends UserDataSource with StubWarnMixin {
  /// The reason why the token is not available.
  final String reason;

  /// The stack trace of the error (if available) of the error (if any) that caused the token to be unavailable.
  final StackTrace? stackTrace;

  /// The error that caused the token to be unavailable (if available).
  final Object? error;

  /// Standard implementation of [UserDataSource].
  TokenUnavailableUserDataSource({
    required this.reason,
    this.stackTrace,
    this.error,
  });

  @override
  Future<List<User>> fetchAllUsers() async {
    warn("fetchAllUsers", error, stackTrace);

    return [];
  }

  @override
  Future<User> fetchCurrentUser() async {
    warn("fetchCurrentUser", error, stackTrace);

    return _defaultUser;
  }

  @override
  Future<User> updateUser(User user) async {
    warn("updateUser", error, stackTrace);

    return _defaultUser;
  }

  User get _defaultUser =>
      User(id: -1, username: "", firstname: "", lastname: "");

  @override
  Future<void> deleteUser(User user) async {
    warn("deleteUser", error, stackTrace);
  }
}
