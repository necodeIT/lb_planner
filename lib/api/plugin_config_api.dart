part of lbplanner_engine;

/// Provides api methods for plugin config functions.
class PluginConfigApi {
  /// Retrieves the [release version](https://github.com/necodeIT/lb_planner/blob/main/versioning.md#:~:text=be%20the%20same.-,Backend%20versioning,-The%20backend%20has) of the moodle plugin.
  static Future<ApiResponse<Version>> getVersion(String token) async {
    var response = await Api.makeRequest(
      functionName: "local_lbplanner_config_get_version",
      token: token,
    );

    Version? version;

    if (response.succeeded) {
      version = Version.fromString(response["version"]);
    }

    return ApiResponse(response.response, version);
  }
}
