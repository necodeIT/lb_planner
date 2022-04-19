part of lbplanner_api;

/// Status of the notification.
enum NotificationStatus {
  /// Notification is unread.
  unread,

  /// Notification is read.
  read,
}

/// Notification status extensions.
extension NotificationStatusExtension on NotificationStatus {
  /// Whether this notification status is unread.
  bool get isUnread => this == NotificationStatus.unread;

  /// Whether this notification status is read.
  bool get isRead => this == NotificationStatus.read;
}
