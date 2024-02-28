import 'package:lb_planner/shared/shared.dart';

/// Base class for all authenitaction services.
abstract class AuthService extends Service {
  /// Initializes a new instance of [AuthService] with logging set up.
  AuthService() : super("Auth");

  /// Requests a token the given [username] and [password].
  ///
  /// Returns a [Future] that resolves to a [String] containing the authentication token.
  Future<String> requestToken(String username, String password);

  /// Checks if the given [token] is valid or not.
  ///
  /// Returns a [Future] that resolves to `true` if the token is valid, `false` otherwise.
  Future<bool> validateToken(String token);
}
