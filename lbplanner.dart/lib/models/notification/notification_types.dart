part of lbplanner_api;

/// Type of the notification.
enum NotifactionTypes {
  /// Notification was triggered by a plan invite.
  invite,

  /// Notification was triggered by an accepted plan invite.
  inviteAccepted,

  /// Notification was triggered by a plan invite rejection.
  inviteDeclined,

  /// Notification was triggered by a user leaving a plan.
  planLeft,

  /// Notification was triggered by a user being removed from a plan.
  planRemoved,

  /// Notification was triggered by a user newly registered.
  userRegistered,
}
