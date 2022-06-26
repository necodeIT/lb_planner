part of lbplanner_engine;

/// Enum containing all the languages supported by the app.
enum Languages {
  /// English
  en,

  /// Restricted
  restricted
}

/// Bool extension for different [Languages].
extension LanguagesExtension on Languages {
  /// Whether the [this] is of type [Languages.en].
  bool get isEn => this == Languages.en;

  /// Whether the [this] is of type [Languages.restricted].
  bool get isRestricted => this == Languages.restricted;
}
