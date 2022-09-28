// ignore_for_file: unnecessary_null_comparison

part of lbplanner_engine;

/// Provides utilities to remap parameters as the moodle api and the models have different names for their parameters.
extension ModelMappingExtensions on Map<String, dynamic> {
  /// Maps paramters to fit [User.fromJson].
  Map<String, dynamic> mapUser(String token) {
    var body = Map.of(this);

    body["language"] = this["lang"];

    var capabilitiesMask = this["capabilities"] as int;

    List<String> capabilities = [];

    for (UserCapability capability in UserCapability.values) {
      var mask = 1 << capability.index;

      if (capabilitiesMask & mask != 0) capabilities.add(capability.name);
    }

    body["capabilities"] = capabilities;
    body["id"] = this["userid"];
    body["avatar"] = this["profileimageurl"];
    body["planId"] = this["planid"];
    body["token"] = token;
    body["colorBlindness"] = this["colorblindness"];
    body["displayTaskCount"] = BoolUtils.fromInt(this["displaytaskcount"]);

    return body;
  }

  /// Maps paramters to fit [Notifications.fromJson].
  Map<String, dynamic> mapNotification() {
    var body = Map.of(this);

    var type = this["type"];
    var status = this["status"];
    var id = this["notificationid"];

    body["timestamp"] = DateTime.fromMillisecondsSinceEpoch(this["timestamp"] * 1000).toString();

    var readTimestamp = this["timestamp_read"];
    if (readTimestamp != null) body["readTimestamp"] = DateTime.fromMillisecondsSinceEpoch(readTimestamp * 1000).toString();

    var info = this["info"];
    if (info != null) body["payload"] = info;

    body["type"] = NotificationTypes.values[type].name;
    body["status"] = NotificationStatus.values[status].name;
    body["id"] = id;

    return body;
  }

  /// Maps parameters to fit [Plan.fromJson]
  Map<String, dynamic> mapPlan() {
    var body = Map.of(this);

    body["id"] = this["planid"];
    body["ekEnabled"] = this["enableek"];
    body["name"] = (this["name"] as String).decoded;

    body["deadlines"] = Map<String, dynamic>.from({for (var deadline in body["deadlines"]) deadline["moduleid"].toString(): Map<String, dynamic>.from(deadline).mapDeadline()});

    body["members"] = Map<String, dynamic>.from({for (var user in body["members"]) user["userid"].toString(): PlanAccessLevels.values[user["accesstype"] as int].name});

    return body;
  }

  /// Maps parameters to fit [Module.fromJson]
  Map<String, dynamic> mapModule() {
    var body = Map.of(this);

    body["id"] = this["moduleid"];
    body["courseId"] = this["courseid"];

    int gradeIndex = this["grade"] ?? -1;
    body["grade"] = gradeIndex.isNegative ? null : ModuleGrades.values[gradeIndex].name;

    int typeIndex = this["type"];
    body["type"] = ModuleTypes.values[typeIndex].name;

    int statusIndex = this["status"];
    body["status"] = ModuleStatus.values[statusIndex].name;

    int unixDeadline = this["deadline"];
    if (unixDeadline != null) body["deadline"] = DateTimeExtensions.fromUnixTimestamp(unixDeadline).toString();

    return body;
  }

  /// Maps parameters to fit [Feedback.fromJson]
  Map<String, dynamic> mapFeedback() {
    var body = Map.of(this);

    int typeIndex = this["type"];
    body["type"] = FeedbackTypes.values[typeIndex].name;

    int statusIndex = this["status"];
    body["status"] = FeedbackStatus.values[statusIndex].name;

    body["userId"] = this["userid"];
    body["lastModifiedBy"] = this["lastmodifiedby"];
    body["timestamp"] = DateTime.fromMillisecondsSinceEpoch(this["timestamp"] * 1000).toString();

    var content = this["content"];

    var logFile = this["logfile"];
    var comment = this["notes"];
    var lastModified = this["lastmodified"];

    if (logFile != null) body["logFile"] = (logFile as String).decoded;
    if (comment != null) body["comment"] = (comment as String).decoded;
    if (content != null) body["content"] = (content as String).decoded;
    if (lastModified != null) body["lastModified"] = DateTime.fromMillisecondsSinceEpoch(lastModified * 1000).toString();

    return body;
  }

  /// Maps parameters to fit [Course.fromJson]
  Map<String, dynamic> mapCourse() {
    var body = Map.of(this);

    body["id"] = this["courseid"];
    body["colorCode"] = (this["color"] as String).decoded;

    return body;
  }

  /// Maps parameters to fit [Deadline.fromJson]
  Map<String, dynamic> mapDeadline() {
    var body = Map.of(this);

    body["moduleId"] = this["moduleid"];
    body["start"] = DateTime.fromMillisecondsSinceEpoch(this["deadlinestart"] * 1000).toString();
    body["end"] = DateTime.fromMillisecondsSinceEpoch(this["deadlineend"] * 1000).toString();

    return body;
  }

  /// Maps parameters to fit [PlanInvite.fromJson]
  Map<String, dynamic> mapPlanInvite() {
    var body = Map.of(this);

    body["invitee"] = this["inviteeid"];
    body["inviter"] = this["inviterid"];
    body["planId"] = this["planid"];
    body["status"] = PlanInviteStatus.values[this["status"]].name;
    body["timeStamp"] = DateTime.fromMillisecondsSinceEpoch(this["timestamp"] * 1000).toString();

    return body;
  }
}