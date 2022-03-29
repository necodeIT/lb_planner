part of lbplanner_api;

/// Provides basic methods to communicate with the moodle API
class Api {
  /// The base URL of the API
  static const apiEndpoint = "https://projekte.tgm.ac.at/moodledev/webservice/rest/server.php";

  /// The format the api should use.
  static const format = "json";

  /// Client used to communicate with the API
  static final Client client = Client();

  /// Sends a request to the API.
  /// - [functionname] The name of the function to call
  /// - [params] The parameters to pass to the function
  /// - [token] The token to use for authentication
  static Future<RawApiResponse> makeRequest({required String functionName, required String token, Map<String, dynamic>? params}) async {
    var url = "$apiEndpoint?moodlewsrestformat=$format&wstoken=$token&wsfunction=$functionName";

    log("Calling $functionName($params) ...", LogTypes.tracking, "API");

    if (params != null) {
      url += "&" + params.entries.map((e) => "${e.key}=${e.value}").join("&");
    }

    var response = await client.get(Uri.parse(url));

    var result = RawApiResponse(response);

    log("Response: ${response.statusCode}${result.failed ? ", Message: '${result.errorMessage}'" : ""}", result.succeeded ? LogTypes.success : LogTypes.error, "API");

    return result;
  }
}