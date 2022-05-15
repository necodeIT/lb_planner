part of lbplanner_api;

/// Name of the key used to access a list.
const kApiListContent = "content";

/// Wrapper for [Response].
/// Provides utilities to handle errors and parse the response body.
class RawApiResponse {
  /// The response.
  final http.Response response;

  late final Map<String, dynamic> _body;

  /// Whether the payload is a list.
  /// If this is true you have to access the list using [kApiListContent].
  ///
  /// Example:
  /// ```dart
  /// var list = response[kApiListContent];
  /// ````
  late final bool isList;

  /// Wrapper for the given [response].
  /// Provides utilities to handle errors and parse the response body.
  RawApiResponse(this.response) {
    var payload = jsonDecode(Uri.decodeComponent(response.body).replaceAll(r'\', r'\\'););

    isList = payload.runtimeType == List;

    if (isList) {
      _body = {kApiListContent: payload};
    } else {
      _body = payload;
    }
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
  
  @override
  String toString() => failed ? errorMessage : body.toString();
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
  ApiResponse(http.Response response, this.value) : super(response) {
    if (succeeded) {
      assert(value != null, "If the response was successful, the value must not be null.");
    }
  }
}
