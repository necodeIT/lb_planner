import 'package:lb_planner/shared/domain/domain.dart';

import 'package:dio/dio.dart';

/// Implements the [NetworkService] using the [Dio] package.
class DioNetworkService extends NetworkService {
  /// The [Dio] client used to send HTTP requests.
  final Dio dio;

  /// Creates a new [DioNetworkService] instance.
  DioNetworkService(this.dio);

  @override
  Future<HttpResponse> get(String url,
      {Map<String, String>? headers,
      Map<String, String>? queryParameters}) async {
    log("Sending GET request to $url with query parameters $queryParameters and headers $headers");

    try {
      var r = await dio.get(url,
          queryParameters: queryParameters, options: Options(headers: headers));

      log("GET request to $url returned with status code ${r.statusCode}: ${r.data.toString().length > 100 ? "[response was truncated due to it's length]" : r.data}");

      return HttpResponse(statusCode: r.statusCode, body: r.data);
    } catch (e, stackTrace) {
      log("Failed to send GET request to $url", e, stackTrace);

      rethrow;
    }
  }

  @override
  Future<HttpResponse> post(String url,
      {Map<String, String>? headers, body}) async {
    log("Sending POST request to $url");

    var r = await dio.post(url, data: body, options: Options(headers: headers));

    log("POST request to $url returned ${r.statusCode} [data redacted]}");

    return HttpResponse(statusCode: r.statusCode, body: r.data);
  }
}
