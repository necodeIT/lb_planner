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

/// Module status extensions.
extension ModuleStatusExtension on ModuleStatus {
  /// Whether this module status is done.
  bool get isDone => this == ModuleStatus.done;

  /// Whether this module status is uploaded.
  bool get isUploaded => this == ModuleStatus.uploaded;

  /// Whether this module status is late.
  bool get isLate => this == ModuleStatus.late;

  /// Whether this module status is pending.
  bool get isPending => this == ModuleStatus.pending;
}
