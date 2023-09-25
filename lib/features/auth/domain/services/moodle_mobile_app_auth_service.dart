import 'package:lb_planner/features/auth/domain/services/services.dart';
import 'package:lb_planner/shared/shared.dart';
import 'package:lb_planner/configs/endpoints.dart' as config;

/// Implements the [AuthService] for the Moodle Mobile App token.
class MoodleMobileAppAuthService extends AuthService {
  /// The network service to use for requests.
  final NetworkService networkService;

  /// The API service to use for verification.
  final ApiService apiService;

  /// Implements the [AuthService] for the Moodle Mobile App token.
  MoodleMobileAppAuthService(this.networkService, this.apiService);

  @override
  Future<String> requestToken(String username, String password) async {
    log.info("Requesting token for user $username");

    const url =
        "${config.kMoodleServerAdress}/login/token.php?service=moodle_mobile_app&moodlewsrestformat=json";

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

    throw "dunno";
  }
}
