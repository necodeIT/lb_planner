part of lbplanner_engine;

/// Contains any possible roles a user can have
enum UserCapability {
  /// Admin role
  admin,

  /// Moderator role
  moderator,

  /// Teacher role
  teacher,

  /// Student role
  student,
}

/// Bool extension for different [UserCapability].
extension UserCapabilityExtensions on UserCapability {
  /// Whether the [this] is of type [UserCapability.admin].
  bool get isAdmin => this == UserCapability.admin;

  /// Whether the [this] is of type [UserCapability.moderator].
  bool get isModerator => this == UserCapability.moderator;

  /// Whether the [this] is of type [UserCapability.teacher].
  bool get isTeacher => this == UserCapability.teacher;

  /// Whether the [this] is of type [UserCapability.student].
  bool get isStudent => this == UserCapability.student;
}

/// Extensions for [UserCapability] set.
extension UserCapabilitiesExtensions on Set<UserCapability> {
  /// Whether the [this] contains [UserCapability.admin].
  bool get hasAdmin => contains(UserCapability.admin);

  /// Whether the [this] contains [UserCapability.moderator].
  bool get hasModerator => contains(UserCapability.moderator);

  /// Whether the [this] contains [UserCapability.teacher].
  bool get hasTeacher => contains(UserCapability.teacher);

  /// Whether the [this] contains [UserCapability.student].
  bool get hasStudent => contains(UserCapability.student);

  /// Gets the highest [UserCapability] in [this].
  UserCapability get highest => isEmpty ? UserCapability.student : reduce((value, element) => value.index < element.index ? value : element);
}
