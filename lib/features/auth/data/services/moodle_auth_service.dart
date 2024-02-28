import 'package:lb_planner/features/auth/domain/domain.dart';
import 'package:lb_planner/shared/shared.dart';
import 'package:lb_planner/configs/endpoints.dart' as config;

/// Implements the [AuthService] using moodle api.
class MoodleAuthService extends AuthService {
  /// The network service to use for requests.
  final NetworkService networkService;

  /// The name of the moodle web service to request the token for.
  final String webService;

  /// Implements the [AuthService] for the Moodle Mobile App token.
  MoodleAuthService(this.webService, this.networkService);

  @override
  Future<String> requestToken(String username, String password) async {
    log("Requesting token for user $username");

    final url =
        "${config.kMoodleServerAdress}/login/token.php?service=$webService&moodlewsrestformat=json";

    var response = await networkService.post(
      url,
      body: {
        "username": username,
        "password": password,
        "moodlewsrestformat": "json",
        "service": webService,
      },
      headers: {"Content-Type": "application/x-www-form-urlencoded"},
    );

    if (response.statusCode == 200) {
      log("Token request successful");

      final body = response.body as JSON;

      final token = body["token"];

      if (token == null) {
        log("Token request failed", body);

        throw Exception("Failed to request token: $body");
      }

      return token;
    }

    log("Token request failed with status code ${response.statusCode}, body: ${response.body}");

    throw Exception("Failed to request token");
  }

  @override
  Future<bool> validateToken(String token) async {
    log("Verifying token [redacted]....");

    var response = await networkService.post(
        "${config.kMoodleServerAdress}/webservice/rest/server.php",
        body: {
          "wstoken": token,
          "moodlewsrestformat": "json",
        });

    if (response.isNotOk) {
      log("Got response ${response.statusCode} from token validation. Invaildating token by default.");

      return false;
    }

    final body = response.body as JSON;

    // if errorcode is 'accessexception' or 'invalidtoken' the token is invalid

    var errorCode = body["errorcode"];

    if (errorCode == "accessexception") {
      log("Token expired");

      return false;
    }

    if (errorCode == "invalidtoken") {
      log("Token invalid");

      return false;
    }

    log("Token is valid");

    return true;
  }
}
