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

    // todo: get modules from deadlines

    if (response.succeeded) plan = Plan.fromJson(response.body.mapPlan());

    return ApiResponse(response.response, plan);
  }
}
