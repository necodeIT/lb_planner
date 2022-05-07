part of lbplanner_api;

/// Contains any possible roles a user can have
enum UserAccessLevels {
  /// Admin role
  admin,

  /// Moderator role
  moderator,

  /// Teacher role
  teacher,

  /// Student role
  student,

  /// Restricted information available
  restricted
}