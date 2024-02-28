import 'package:either_dart/either.dart';
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
    log("Calling function $function ${redact ? "with [redacted body]" : "with body $body"}");

    body["wstoken"] = token;
    body["moodlewsrestformat"] = "json";
    body["wsfunction"] = function;

    try {
      var response = await networkService.post(
        "${config.kMoodleServerAdress}/webservice/rest/server.php",
        body: body,
      );

      if (response.statusCode == 200) {
        log("Function $function returned ${redact ? "[redacted body]" : "body ${response.body}"}");

        final responseTemplate = HttpResponse<Either<List<JSON>, JSON>>(
            statusCode: response.statusCode, body: null);

        if (response.body is List) {
          // convert List<dynamic> to List<JSON>
          final List<JSON> jsonList = (response.body as List<dynamic>)
              .map((dynamic e) => e as JSON)
              .toList();

          return responseTemplate.copyWith(
            body: Left(jsonList),
          );
        }

        return responseTemplate.copyWith(
          body: Right(response.body),
        );
      }

      log("Error calling function $function: ${response.statusCode} ${response.body}");

      return HttpResponse(
        statusCode: response.statusCode,
        body: Right(
          response.body,
        ),
      );
    } catch (e, stackTrace) {
      log("Failed to call function $function", e, stackTrace);
      rethrow;
    }
  }
}
