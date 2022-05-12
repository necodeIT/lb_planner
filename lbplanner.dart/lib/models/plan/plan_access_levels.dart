part of lbplanner_api;

/// Access types for the plan.
enum PlanAccessLevels {
  /// The user is the owner of the plan
  owner,

  /// The user is a member of the plan and can modify it
  write,

  /// The user is a member of the plan and can only read it
  read,
}

/// Plan access types extensions.
extension PlanAccessTypesExtension on PlanAccessLevels {
  /// Whether this access type is owner.
  bool get isOwner => this == PlanAccessLevels.owner;

  /// Whether this access type is write.
  bool get isWrite => this == PlanAccessLevels.write;

  /// Whether this access type is read.
  bool get isRead => this == PlanAccessLevels.read;
}
