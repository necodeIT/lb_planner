part of lbplanner_api;

/// Provides basic methods to communicate with the moodle API
class Api {
  /// The root url of the server.
  static const serverRoot = kReleaseMode ? "https://elearning.tgm.ac.at" : "https://projekte.tgm.ac.at/moodledev";

  /// The base URL of the API
  static const apiEndpoint = "$serverRoot/webservice/rest/server.php";

  /// The format the api should use.
  static const format = "json";

  /// Client used to communicate with the API
  static final http.Client client = http.Client();

  /// Sends a request to the API.
  /// - [functionName] The name of the function to call
  /// - [params] The parameters to pass to the function
  /// - [token] The token to use for authentication
  static Future<RawApiResponse> makeRequest({required String functionName, required String token, Map<String, dynamic>? params}) async {
    var url = "$apiEndpoint?moodlewsrestformat=$format&wstoken=$token&wsfunction=$functionName";

    log("Calling $functionName(${params ?? ''}) ...", LogTypes.tracking);

    if (params != null) {
      url += "&" + params.entries.map((e) => "${e.key}=${e.value}").join("&");
    }

    var response = await client.get(Uri.parse(url));

    var result = RawApiResponse(response);

    _logResponse(result);

    if (result.failed) onError?.call(result);

    return result;
  }

  /// Requests a token for the given [service] with the given [username] and [password].
  static Future<ApiResponse<String>> requestToken(String password, String username, ApiServices service) async {
    log("Requesting token for ${service.name}...", LogTypes.tracking);

    var encodedPassword = Uri.encodeComponent(password);

    var url = "$serverRoot/login/token.php?username=$username&service=${service.name}&moodlewsrestformat=$format&password=$encodedPassword";

    var response = await client.get(Uri.parse(url));

    var json = jsonDecode(response.body);

    var result = ApiResponse<String>(response, json["token"]);

    _logResponse(result);

    return result;
  }

  static void _logResponse(RawApiResponse response) {
    log("Response: ${response.response.statusCode}${response.failed ? ", Message: '${response.errorMessage}'" : ""}", response.succeeded ? LogTypes.success : LogTypes.error);
  }

  /// Callback called when an API call reults in an error.
  static void Function(RawApiResponse response)? onError;
}
