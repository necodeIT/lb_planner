part of lbplanner_api;

/// [Plan] API
class PlanApi {
  /// Retrieves the entire plan of the given [userId] and [planId].
  static Future<ApiResponse<Plan>> getPlan(String token, int planId, int userId) async {
    var response = await Api.makeRequest(
      functionName: "local_lbplanner_plan_get_plan",
      token: token,
      params: {"planid": planId, "userid": userId},
    );

    Plan? plan;

    if (response.succeeded) plan = Plan.fromJson(response.body.mapPlan());
    return ApiResponse(response.response, plan);
  }

  /// Deletes all deadlines of the plan[userId] and [planId].
  static Future<ApiResponse<Plan>> clearPlan(String token, int planId, int userId) async {
    var response = await Api.makeRequest(
      functionName: "local_lbplanner_plan_clear_plan",
      token: token,
      params: {"planid": planId, "userid": userId},
    );

    Plan? plan;

    if (response.succeeded) plan = Plan.fromJson(response.body.mapPlan());
    return ApiResponse(response.response, plan);
  }

  /// Deletes a specific deadline of the plan[userId] and [planId].
  static Future<ApiResponse<Plan>> deleteDeadline(String token, int planId, int userId, int moduleId) async {
    var response = await Api.makeRequest(
      functionName: "local_lbplanner_plan_delete_deadline",
      token: token,
      params: {"planid": planId, "userid": userId, "deadlineid": moduleId},
    );

    Plan? plan;

    if (response.succeeded) plan = Plan.fromJson(response.body.mapPlan());
    return ApiResponse(response.response, plan);
  }

  /// Gets the access level of the user in the plan with the given [userId] and [planId].
  static Future<ApiResponse<Plan>> getAccess(String token, int planId, int userId) async {
    var response = await Api.makeRequest(
      functionName: "local_lbplanner_plan_get_access",
      token: token,
      params: {"planid": planId, "userid": userId},
    );

    Plan? plan;

    if (response.succeeded) plan = Plan.fromJson(response.body.mapPlan());
    return ApiResponse(response.response, plan);
  }

  /// Gets all invites of the user with the given [userId].
  static Future<ApiResponse<Plan>> getInvites(String token, int userId) async {
    var response = await Api.makeRequest(
      functionName: "local_lbplanner_plan_get_invites",
      token: token,
      params: {"userid": userId},
    );

    Plan? plan;
    List<PlanInvite> planInvites;

    if (response.succeeded) plan = Plan.fromJson(response.body.mapPlan());
    return ApiResponse(response.response, plan);
  }
}
