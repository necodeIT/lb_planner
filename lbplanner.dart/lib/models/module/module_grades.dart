part of lbplanner_api;

/// Enum containing all the grades a student can receive.
enum ModuleGrades {
  /// Moodle grade "Erweiterte Kompetentz Vollständig"
  ekv,

  /// Moodle grade "Erweiterte Kompetentz Teilweise"
  ek,

  /// Moodle grade "Grundlegende Kompetentz Vollständig"
  gkv,

  /// Moodle grade "Grundlegende Kompetentz Teilweise"
  gk,

  /// Moodle grade "Nicht erfüllt"
  rip,
}

/// Modules grades extensions.
extension ModuleGradesExtension on ModuleGrades {
  /// Whether this grade is an ekv grade.
  bool get isEKV => this == ModuleGrades.ekv;

  /// Whether this grade is an ek grade.
  bool get isEK => this == ModuleGrades.ek;

  /// Whether this grade is a gkv grade.
  bool get isGKV => this == ModuleGrades.gkv;

  /// Whether this grade is a gk grade.
  bool get isGK => this == ModuleGrades.gk;

  /// Whether this grade is a rip grade.
  bool get isRIP => this == ModuleGrades.rip;
}
