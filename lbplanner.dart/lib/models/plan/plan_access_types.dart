part of lbplanner_api;

/// Access types for the plan.
enum PlanAccessTypes {
  /// The user is the owner of the plan
  owner,

  /// The user is a member of the plan and can modify it
  write,

  /// The user is a member of the plan and can only read it
  read,
}

/// Plan access types extensions.
extension PlanAccessTypesExtension on PlanAccessTypes {
  /// Whether this access type is owner.
  bool get isOwner => this == PlanAccessTypes.owner;

  /// Whether this access type is write.
  bool get isWrite => this == PlanAccessTypes.write;

  /// Whether this access type is read.
  bool get isRead => this == PlanAccessTypes.read;
}
