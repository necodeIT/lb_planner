part of lbplanner_engine;

/// Modules API
class ModulesApi {
  /// Retrieves all modules for the given [userId].
  static Future<ApiResponse<List<Module>>> getAllModules(String token, int userId) async {
    var response = await Api.makeRequest(
      functionName: "local_lbplanner_modules_get_all_modules",
      token: token,
      params: {
        "userid": userId,
      },
    );

    List<Module>? modules;

    if (response.succeeded) {
      modules = [];

      for (var module in response[kApiListContent]) {
        var moduleMap = Map<String, dynamic>.of(module);

        modules.add(Module.fromJson(moduleMap.mapModule()));
      }
    }

    return ApiResponse(response.response, modules);
  }

  /// Retrieves the given module of the given [moduleId] for the given [userId].
  static Future<ApiResponse<Module>> getModule(String token, int userId, int moduleId) async {
    var response = await Api.makeRequest(
      functionName: "local_lbplanner_modules_get_module",
      token: token,
      params: {
        "userid": userId,
        "moduleid": moduleId,
      },
    );

    Module? module;

    if (response.succeeded) module = Module.fromJson(response.body.mapModule());

    return ApiResponse(response.response, module);
  }

  /// Retrives all modules for the given [courseId] and [userId].
  static Future<ApiResponse<List<Module>>> getAllCourseModules(String token, int userId, int courseId) async {
    var response = await Api.makeRequest(
      functionName: "local_lbplanner_modules_get_all_course_modules",
      token: token,
      params: {
        "userid": userId,
        "courseid": courseId,
      },
    );

    List<Module>? modules;

    if (response.succeeded) {
      modules = [];

      for (var module in response[kApiListContent]) {
        var moduleMap = Map<String, dynamic>.of(module);

        modules.add(Module.fromJson(moduleMap.mapModule()));
      }
    }

    return ApiResponse(response.response, modules);
  }
}
