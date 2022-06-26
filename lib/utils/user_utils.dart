part of lbplanner_engine;

/// Utils for [User]
extension UserUtils on User {
  /// Whether the user can make requests.
  bool get canMakeRequests => !restricted && !loading && InternetProvider.connected;

  /// Whether the user has an access level of at least [UserAccessLevels.moderator].
  bool get isElevated => accessLevel.isAdmin || accessLevel.isModerator;
}
