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
