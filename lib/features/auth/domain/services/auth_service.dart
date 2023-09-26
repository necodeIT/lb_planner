import 'package:logging/logging.dart';

/// Base class for all authenitaction services.
abstract class AuthService {
  /// The logger to use for this instance.
  Logger get log => Logger("AuthService.$runtimeType");

  /// Requests a token the given [username] and [password].
  ///
  /// Returns a [Future] that resolves to a [String] containing the authentication token.
  Future<String> requestToken(String username, String password);

  /// Checks if the given [token] is valid or not.
  ///
  /// Returns a [Future] that resolves to `true` if the token is valid, `false` otherwise.
  Future<bool> validateToken(String token);
}
