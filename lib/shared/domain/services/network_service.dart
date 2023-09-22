import 'package:lb_planner/shared/domain/models/http_response.dart';
import 'package:logging/logging.dart';

/// A base class for all network services that provides common HTTP operations.
///
/// Implement this class to create specific network services for your application.
abstract class NetworkService {
  /// The [Logger] instance for this class.
  Logger get log => Logger("NetworkService.$runtimeType");

  /// Sends a GET request to the specified [url].
  ///
  /// Optionally, you can specify custom [headers] and [queryParameters].
  ///
  /// Returns a [Future] that completes with an [HttpResponse] when the request is complete.
  Future<HttpResponse> get(String url, {Map<String, String>? headers, Map<String, String>? queryParameters});

  /// Sends a POST request to the specified [url].
  ///
  /// Optionally, you can specify custom [headers] and a request [body].
  ///
  /// Returns a [Future] that completes with an [HttpResponse] when the request is complete.
  Future<HttpResponse> post(String url, {Map<String, String>? headers, dynamic body});
}
