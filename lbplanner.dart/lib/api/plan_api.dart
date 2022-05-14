part of lbplanner_api;

/// [Plan] API
class PlanApi {
  /// Retrieves the entire plan of the given [userId] and [planId].
  static Future<ApiResponse<Plan>> getPlan(String token, int planId, int userId) async {
    var response = await Api.makeRequest(
      functionName: "local_lbplanner_plan_get_plan",
      token: token,
      params: {"userid": userId},
    );

    Plan? plan;

    if (response.succeeded) plan = Plan.fromJson(response.body.mapPlan());
    return ApiResponse(response.response, plan);
  }

  /// Deletes all deadlines of the plan[userId] and [planId].
  static Future<ApiResponse<Plan>> clearPlan(String token, int userId, int planId) async {
    var response = await Api.makeRequest(
      functionName: "local_lbplanner_plan_clear_plan",
      token: token,
      params: {"planid": planId, "userid": userId},
    );

    Plan? plan;

    if (response.succeeded) plan = Plan.fromJson(response.body.mapPlan());
    return ApiResponse(response.response, plan);
  }

  /// Leaves the plan [userId] and [planId].
  static Future<ApiResponse<Plan>> leavePlan(String token, int planId, int userId) async {
    var response = await Api.makeRequest(
      functionName: "local_lbplanner_plan_leave_plan",
      token: token,
      params: {"planid": planId, "userid": userId},
    );

    /// TODO: Wait till Muhi corrects the API functions and look what it returns.
    Plan? plan;

    if (response.succeeded) plan = Plan.fromJson(response.body.mapPlan());
    return ApiResponse(response.response, plan);
  }

  /// Updates the plan [userId] and [planId].
  static Future<ApiResponse<Plan>> updatePlan(String token, int userId, Plan data) async {
    var response = await Api.makeRequest(
      functionName: "local_lbplanner_plan_update_plan",
      token: token,
      params: {
        "planid": data.id,
        "userid": userId,
        "planname": data.name,
        "enableek": data.ekEnabled.intValue,
      },
    );

    Plan? plan;

    if (response.succeeded) plan = Plan.fromJson(response.body.mapPlan());
    return ApiResponse(response.response, plan);
  }

  /// Adds a new deadline to the plan [userId] and [planId].
  static Future<ApiResponse<Plan>> addDeadline(String token, int userId, int planId, Deadline deadline) async {
    var response = await Api.makeRequest(
      functionName: "local_lbplanner_plan_add_deadline",
      token: token,
      params: {
        "planid": planId,
        "userid": userId,
        "moduleid": deadline.moduleId,
        "deadlinestart": deadline.start.unixTimestamp,
        "deadlineend": deadline.end.unixTimestamp,
      },
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
      params: {"planid": planId, "userid": userId, "moduleid": moduleId},
    );

    Plan? plan;

    if (response.succeeded) plan = Plan.fromJson(response.body.mapPlan());
    return ApiResponse(response.response, plan);
  }

  /// Updates a specific deadline of the plan[userId] and [planId].
  static Future<ApiResponse<Plan>> updateDeadline(String token, int userId, int planId, Deadline deadline) async {
    var response = await Api.makeRequest(
      functionName: "local_lbplanner_plan_update_deadline",
      token: token,
      params: {
        "planid": planId,
        "userid": userId,
        "moduleid": deadline.moduleId,
        "deadlinestart": deadline.start.unixTimestamp,
        "deadlineend": deadline.end.unixTimestamp,
      },
    );

    Plan? plan;

    if (response.succeeded) plan = Plan.fromJson(response.body.mapPlan());
    return ApiResponse(response.response, plan);
  }

  /// Gets the access level of the user in the plan with the given [userId] and [planId].
  static Future<ApiResponse<PlanAccessLevels>> getAccess(String token, int planId, int userId) async {
    var response = await Api.makeRequest(
      functionName: "local_lbplanner_plan_get_access",
      token: token,
      params: {"planid": planId, "userid": userId},
    );

    PlanAccessLevels? access;

    if (response.succeeded) access = PlanAccessLevels.values[response["accesstype"]];
    return ApiResponse(response.response, access);
  }

  /// Updates the Access level of the user in the plan with the given [userId] and [planId].
  static Future<ApiResponse<Plan>> updateAccess(String token, int userId, int planId, PlanAccessLevels access, int memberId) async {
    var response = await Api.makeRequest(
      functionName: "local_lbplanner_plan_update_access",
      token: token,
      params: {"planid": planId, "userid": userId, "accesstype": access.index, "memberid": memberId},
    );

    Plan? plan;

    if (response.succeeded) plan = Plan.fromJson(response.body.mapPlan());
    return ApiResponse(response.response, plan);
  }

  /// Gets all invites of the user with the given [userId].
  static Future<ApiResponse<List<PlanInvite>>> getInvites(String token, int userId) async {
    var response = await Api.makeRequest(
      functionName: "local_lbplanner_plan_get_invites",
      token: token,
      params: {"userid": userId},
    );

    List<PlanInvite>? planInvites = [];

    if (response.succeeded) {
      planInvites = [for (var invite in response.body["invites"]) PlanInvite.fromJson(invite.mapPlanInvite())];
    }

    return ApiResponse(response.response, planInvites);
  }

  /// Invites a user with the given [inviteeId] to the plan with the given [planId].
  static Future<ApiResponse<PlanInvite>> inviteUser(String token, int inviterId, int planId, int inviteeId) async {
    var response = await Api.makeRequest(
      functionName: "local_lbplanner_plan_invite_user",
      token: token,
      params: {"inviterid": inviterId, "planid": planId, "inviteeid": inviteeId},
    );

    PlanInvite? planInvite;

    if (response.succeeded) planInvite = PlanInvite.fromJson(response.body.mapPlanInvite());
    return ApiResponse(response.response, planInvite);
  }

  /// Updates the access level of the user with the given [userId] and [planId].
  static Future<ApiResponse<PlanInvite>> updateInvite(String token, PlanInvite invite) async {
    var response = await Api.makeRequest(
      functionName: "local_lbplanner_plan_update_invite",
      token: token,
      params: {
        "planid": invite.planId,
        "inviteid": invite.invitee,
        "status": invite.status.index,
      },
    );

    PlanInvite? planInvite;

    if (response.succeeded) planInvite = PlanInvite.fromJson(response.body.mapPlanInvite());
    return ApiResponse(response.response, planInvite);
  }

  /// Removes an user of the plan with the given [userId] and [planId].
  static Future<ApiResponse<Plan>> removeUser(String token, int planId, int userId, int removeUserId) async {
    var response = await Api.makeRequest(
      functionName: "local_lbplanner_plan_remove_user",
      token: token,
      params: {
        "planid": planId,
        "removeuserid": removeUserId,
        "userid": userId,
      },
    );

    Plan? plan;

    if (response.succeeded) plan = Plan.fromJson(response.body.mapPlan());
    return ApiResponse(response.response, plan);
  }
}
