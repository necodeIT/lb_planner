part of lbplanner_api;

/// Wrapper for [Response].
/// Provides utilities to handle errors and parse the response body.
class RawApiResponse {
  /// The response.
  final Response response;

  late final Map<String, dynamic> _body;

  /// Wrapper for the given [response].
  /// Provides utilities to handle errors and parse the response body.
  RawApiResponse(this.response) {
    _body = jsonDecode(response.body);
  }

  /// Whether the response was successful.
  bool get succeeded => response.statusCode >= 200 && response.statusCode < 300 && _body["exception"] == null && _body["error"] == null;

  /// Wheter the response failed.
  bool get failed => !succeeded;

  /// The response body as a map.
  Map<String, dynamic> get body => Map.unmodifiable(_body);

  /// Retrieves the value of the given [key] from the response [body].
  operator [](String key) => body[key];

  /// Error message of the response.
  String get errorMessage => failed ? _body["message"] ?? _body["error"] ?? "" : "";
}

/// Response from the API.
/// Provides utilities to handle errors and parse the response body.
/// Also contains the parsed response body.
class ApiResponse<T> extends RawApiResponse {
  /// The parsed response body.
  /// Must not be null if [succeeded] is true.
  final T? value;

  /// Response from the API.
  /// Provides utilities to handle errors and parse the response body.
  /// Also contains the parsed response body.
  ApiResponse(Response response, this.value) : super(response) {
    if (succeeded) {
      assert(value != null, "If the response was successful, the value must not be null.");
    }
  }
}
