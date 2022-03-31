part of lbplanner_api;

/// Enum containing all the states a module can have.
enum ModuleStatus {
  /// Module has received a positive grade.
  done,

  /// Module has not received a grade yet.
  uploaded,

  /// Module has not been uploaded yet and the deadline is overdue or has received a negative grade.
  late,

  /// Module has not been uploaded yet and the deadline is not yet reached.
  pending
}
