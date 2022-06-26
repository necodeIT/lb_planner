part of lbplanner_engine;

/// Feedback status.
enum FeedbackStatus {
  /// Feedback is new.
  unread,

  /// Feedback is read.
  read,
}

/// Feedback status extensions.
extension FeedbackStatusExtension on FeedbackStatus {
  /// Whether this feedback status is unread.
  bool get isUnread => this == FeedbackStatus.unread;

  /// Whether this feedback status is read.
  bool get isRead => this == FeedbackStatus.read;
}
