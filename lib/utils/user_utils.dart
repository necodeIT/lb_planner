part of lbplanner_engine;

/// Utils for [User]
extension UserUtils on User {
  /// Whether the user can make requests.
  bool get canMakeRequests => !invalid && InternetProvider.connected;

  /// Whether the user has at least [UserCapability.moderator].
  bool get isElevated => capabilities.hasAdmin || capabilities.hasModerator;
}
