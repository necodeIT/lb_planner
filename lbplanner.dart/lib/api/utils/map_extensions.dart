part of lbplanner_api;

/// Provides utilities to remap parameters as the moodle api and the models have different names for their parameters.
extension UserMappingExtensions on Map<String, dynamic> {
  /// Maps paramters to fit [User.fromJson].
  Map<String, dynamic> mapUser(String token) {
    var body = Map.of(this);

    body["language"] = this["lang"];

    var role = this["role"];
    if (role != null) body["accessLevel"] = UserAccessLevels.values[role].name;

    body["id"] = this["userid"];
    body["avatar"] = this["profileimageurl"];
    body["planId"] = this["planid"];
    body["token"] = token;

    return body;
  }

  /// Maps paramters to fit [Notifications.fromJson].
  Map<String, dynamic> mapNotification() {
    var body = Map.of(this);

    var payload = this["info"] ?? "{}";
    var type = this["type"];
    var status = this["status"];
    var id = this["notificationid"];

    body["payload"] = jsonDecode(payload);
    body["type"] = NotificationTypes.values[type].name;
    body["status"] = NotificationStatus.values[status].name;
    body["id"] = id;

    return body;
  }

  /// Maps parameters to fit [Plan.fromJson]
  Map<String, dynamic> mapPlan() {
    // todo: map parameters

    return this;
  }
}
