import 'package:either_dart/either.dart';
import 'package:lb_planner/shared/domain/services/services.dart';
import 'package:lb_planner/shared/domain/models/models.dart';
import 'package:logging/logging.dart';

/// Abstracts the communication with an API using [NetworkService].
abstract class ApiService {
  /// The [Logger] instance for this class.
  Logger get log => Logger("ApiService.$runtimeType");

  /// Calls the specified [function] on the Moodle-API with the specified [token].
  ///
  /// Note: The [token] must have the required permissions use the web service that is providing the function you are trying to call.
  ///
  /// If [redact] is set to true, the response/request body will not be logged.
  Future<HttpResponse<Either<List<JSON>, JSON>>> callFunction(
      {required String function,
      required String token,
      required JSON body,
      bool redact = false});
}

/// Provides helper methods for [HttpResponse]s returned by [ApiService].
extension ApiServiceResponseHelpers on HttpResponse<Either<List<JSON>, JSON>> {
  /// Returns the single [JSON] object in the response body.
  ///
  /// Throws an [AssertionError] if the response body is null or not a single object.
  JSON expectSingle() {
    assert(isOk,
        "Response does not indicate success (status code: $statusCode). This should not happen. Try to call isOk and implement your own custom error handling before calling this method.");

    if (body == null) {
      throw AssertionError("Response body is null");
    }

    if (body!.isLeft) {
      throw AssertionError("Expected single object, got array");
    }

    return body!.right;
  }

  /// Returns the [List] of [JSON] objects in the response body.
  ///
  /// Throws an [AssertionError] if the response body is null or not an array.
  List<JSON> expectMultiple() {
    assert(isOk,
        "Response does not indicate success (status code: $statusCode). This should not happen. Try to call isOk and implement your own custom error handling before calling this method.");

    if (body == null) {
      throw AssertionError("Response body is null");
    }

    if (body!.isLeft) {
      throw AssertionError("Expected array, got single object");
    }

    return body!.left;
  }
}
