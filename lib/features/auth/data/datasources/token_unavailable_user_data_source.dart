import 'package:lb_planner/features/auth/auth.dart';
import 'package:logging/logging.dart';

/// Implementation of [UserDataSource] to use when no token is available.
///
/// This implementation will not throw any errors, but will return empty lists and default values instead.
class TokenUnavailableUserDataSource extends UserDataSource {
  /// The reason why the token is not available.
  final String reason;

  /// The stack trace of the error (if available) of the error (if any) that caused the token to be unavailable.
  final StackTrace? stackTrace;

  /// The logger to use.
  final Logger logger = Logger("TokenUnavailableUserDataSource");

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
    _warn("fetchAllUsers");

    return [];
  }

  @override
  Future<User> fetchCurrentUser() async {
    _warn("fetchCurrentUser");

    return _defaultUser;
  }

  @override
  Future<User> updateUser(User user) async {
    _warn("updateUser");

    return _defaultUser;
  }

  User get _defaultUser =>
      User(id: -1, username: "", firstname: "", lastname: "");

  void _warn(String method) => logger.warning(
      "Called $method on TokenUnavailableUserDataSource: $reason",
      error,
      stackTrace);
}
