part of lbplanner_engine;

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

/// Bool extension for different [UserAccessLevels].
extension UserAccessLevelsExtension on UserAccessLevels {
  /// Whether the [this] is of type [UserAccessLevels.admin].
  bool get isAdmin => this == UserAccessLevels.admin;

  /// Whether the [this] is of type [UserAccessLevels.moderator].
  bool get isModerator => this == UserAccessLevels.moderator;

  /// Whether the [this] is of type [UserAccessLevels.teacher].
  bool get isTeacher => this == UserAccessLevels.teacher;

  /// Whether the [this] is of type [UserAccessLevels.student].
  bool get isStudent => this == UserAccessLevels.student;

  /// Whether the [this] is of type [UserAccessLevels.restricted].
  bool get isRestricted => this == UserAccessLevels.restricted;
}
