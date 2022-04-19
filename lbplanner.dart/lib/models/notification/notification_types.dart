part of lbplanner_api;

/// Type of the notification.
enum NotificationTypes {
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

/// Notification type extensions.
extension NotificationTypesExtension on NotificationTypes {
  /// Whether this notification type is an invite.
  bool get isInvite => this == NotificationTypes.invite;

  /// Whether this notification type is an invite accepted.
  bool get isInviteAccepted => this == NotificationTypes.inviteAccepted;

  /// Whether this notification type is an invite declined.
  bool get isInviteDeclined => this == NotificationTypes.inviteDeclined;

  /// Whether this notification type is a plan left.
  bool get isPlanLeft => this == NotificationTypes.planLeft;

  /// Whether this notification type is a plan removed.
  bool get isPlanRemoved => this == NotificationTypes.planRemoved;

  /// Whether this notification type is a user registered.
  bool get isUserRegistered => this == NotificationTypes.userRegistered;
}
