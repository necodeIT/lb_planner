import 'package:lb_planner/features/auth/domain/services/services.dart';
import 'package:lb_planner/shared/shared.dart';
import 'package:lb_planner/configs/endpoints.dart' as config;

/// Implements the [AuthService] using moodle api.
class MoodleAuthService extends AuthService {
  /// The network service to use for requests.
  final NetworkService networkService;

  /// The name of the moodle webservice to request the token for.
  final String webservice;

  /// Implements the [AuthService] for the Moodle Mobile App token.
  MoodleAuthService(this.webservice, this.networkService);

  @override
  Future<String> requestToken(String username, String password) async {
    log.info("Requesting token for user $username");

    final url =
        "${config.kMoodleServerAdress}/login/token.php?service=$webservice&moodlewsrestformat=json";

    var response = await networkService.post(
      url,
      body: {
        "username": username,
        "password": password,
      },
      headers: {"Content-Type": "application/x-www-form-urlencoded"},
    );

    if (response.statusCode == 200) {
      log.info("Token request successful");

      final body = response.body as JSON;

      return body["token"];
    }

    log.severe(
        "Token request failed with status code ${response.statusCode}, body: ${response.body}");

    throw Exception("Failed to request token");
  }

  @override
  Future<bool> verifyToken(String token) {
    log.info("Verifying token [redacted]....");

    // TODO: figure out how to verify token

    throw UnimplementedError();
  }
}
