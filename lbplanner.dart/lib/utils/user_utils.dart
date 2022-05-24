part of lbplanner_api;

/// Utils for [User]
extension UserUtils on User {
  /// Whether the user can make requests.
  bool get canMakeRequests => !restricted && !loading;

  /// Whether the user has an access level of at least [UserAccessLevels.moderator].
  bool get isElevated => accessLevel.isAdmin || accessLevel.isModerator;
}
