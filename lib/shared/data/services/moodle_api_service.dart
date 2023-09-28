import 'package:either_dart/src/either.dart';
import 'package:lb_planner/shared/domain/domain.dart';

import 'package:lb_planner/configs/endpoints.dart' as config;

/// Implements [ApiService] for the Moodle-API.
class MoodleApiService extends ApiService {
  /// The [NetworkService] used to communicate with the Moodle-API.
  final NetworkService networkService;

  /// Implements [ApiService] for the Moodle-API.
  MoodleApiService(this.networkService);

  @override
  Future<HttpResponse<Either<List<JSON>, JSON>>> callFunction(
      {required String function,
      required String token,
      required JSON body,
      bool redact = false}) async {
    log.info(
        "Calling function $function ${redact ? "with [redacted body]" : "with body $body"}");

    body["wstoken"] = token;
    body["moodlewsrestformat"] = "json";
    body["wsfunction"] = function;

    var response = await networkService.post(
        "${config.kMoodleServerAdress}/webservice/rest/server.php",
        body: body);

    if (response.statusCode == 200) {
      log.info(
          "Function $function returned ${redact ? "[redacted body]" : "body ${response.body}"}");

      return HttpResponse(statusCode: response.statusCode, body: response.body);
    }

    log.warning(
        "Error calling function $function: ${response.statusCode} ${response.body}");

    return HttpResponse(statusCode: response.statusCode, body: response.body);
  }
}
