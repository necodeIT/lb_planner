import 'package:logging/logging.dart';

/// Base class for all authenitaction services.
abstract class AuthService {
  /// The logger to use for this instance.
  Logger get log => Logger("AuthService.$runtimeType");

  /// Requests a token the given [username] and [password].
  ///
  /// Returns a [Future] that resolves to a [String] containing the authentication token.
  Future<String> requestToken(String username, String password);

  /// Verifies the validity of the given [token].
  Future<bool> verifyToken(String token);
}
