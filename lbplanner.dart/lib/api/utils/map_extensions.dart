part of lbplanner_api;

/// Provides utilities to remap parameters as the moodle api and the models have different names for their parameters.
extension UserMappingExtensions on Map<String, dynamic> {
  /// Maps paramters from to fit [User.fromJson].
  Map<String, dynamic> mapUser() {
    var body = Map.of(this);
    body["language"] = this["lang"];
    body["accessLevel"] = AccessLevels.values[this["role"]].toString().split(".").last;
    body["id"] = this["userid"];
    body["avatar"] = this["profileimageurl"];
    body["planId"] = this["planid"];

    return body;
  }
}
