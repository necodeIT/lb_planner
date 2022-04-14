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
