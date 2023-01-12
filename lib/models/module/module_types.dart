part of lbplanner_engine;

/// Enum containing the module types a module can have.
enum ModuleTypes {
  /// Module type "Grundlegende Kompetentz"
  gk,

  /// Module type "Erweiterte Kompetentz"
  ek,

  /// Module type "Test/Schularbeit"
  test,
  
  /// Module type "Mitarbeit"
  m
}

/// Module types extensions.
extension ModuleTypesExtension on ModuleTypes {
  /// Whether this module type is a gk.
  bool get isGK => this == ModuleTypes.gk;

  /// Whether this module type is an ek.
  bool get isEK => this == ModuleTypes.ek;

  /// Whether this module type is a test.
  bool get isTest => this == ModuleTypes.test;
}
