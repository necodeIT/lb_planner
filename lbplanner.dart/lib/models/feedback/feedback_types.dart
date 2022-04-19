part of lbplanner_api;

/// Feedback types.
enum FeedbackTypes {
  /// Feedback is a suggestion / feature request.
  suggestion,

  /// Feedback is a bug report.
  bug,

  /// Feedback is an error report (such as typos).
  error,

  /// Feedback is uncategorized.
  other,
}

/// Feedback type extensions.
extension FeedbackTypesExtension on FeedbackTypes {
  /// Whether this feedback type is a bug.
  bool get isBug => this == FeedbackTypes.bug;

  /// Whether this feedback type is a suggestion.
  bool get isSuggestion => this == FeedbackTypes.suggestion;

  /// Whether this feedback type is an error.
  bool get isError => this == FeedbackTypes.error;

  /// Whether this feedback type is uncategorized.
  bool get isOther => this == FeedbackTypes.other;
}
