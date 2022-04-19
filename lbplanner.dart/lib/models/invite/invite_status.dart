part of lbplanner_api;

/// Status of the invite.
enum PlanInviteStatus {
  /// The invite is pending.
  pending,

  /// The invite is accepted.
  accepted,

  /// The invite is declined.
  declined,
}

/// Plan invite status extensions.
extension PlanInviteStatusExtension on PlanInviteStatus {
  /// Whether this invite status is pending.
  bool get isPending => this == PlanInviteStatus.pending;

  /// Whether this invite status is accepted.
  bool get isAccepted => this == PlanInviteStatus.accepted;

  /// Whether this invite status is declined.
  bool get isDeclined => this == PlanInviteStatus.declined;
}
