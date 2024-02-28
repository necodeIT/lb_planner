import 'package:either_dart/either.dart';
import 'package:lb_planner/shared/shared.dart';

/// Abstracts the communication with an API using [NetworkService].
abstract class ApiService extends Service {
  /// Initializes a new instance of [ApiService] with logging set up.
  ApiService() : super("API");

  /// Calls the specified [function] on the Moodle-API with the specified [token].
  ///
  /// Note: The [token] must have the required permissions use the web service that is providing the function you are trying to call.
  ///
  /// If [redact] is set to true, the response/request body will not be logged.
  Future<HttpResponse<Either<List<JSON>, JSON>>> callFunction({
    required String function,
    required String token,
    required JSON body,
    bool redact = false,
  });
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

    if (body!.isRight) {
      throw AssertionError("Expected array, got single object");
    }

    return body!.left;
  }

  /// Returns `true` if the response indicates success. Otherwise `false`.
  ///
  /// Unlike [HttpResponse.isOk], this method also checks the response body for error codes.
  bool get success {
    if (!isOk) return false;

    if (body != null && body!.isRight) {
      final json = body!.right;

      // check if "exception" or "errorcode" is present in the response body
      if (json.containsKey("exception") || json.containsKey("errorcode")) {
        return false;
      }
    }

    return true;
  }

  /// Returns `true` if the response indicates failure. Otherwise `false`.
  ///
  /// Unlike [HttpResponse.isNotOk], this method also checks the response body for error codes.
  bool get failed => !success;
}
