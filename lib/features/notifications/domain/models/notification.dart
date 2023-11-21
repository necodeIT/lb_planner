// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lb_planner/features/auth/auth.dart';

part 'notification.freezed.dart';
part 'notification.g.dart';

/// A notification that is sent to the user.
///
/// Notifications are sent to the user when something happens that they should be informed about (e.g. somebody invites them to a plan).
///
/// There are different types of notifications, that are defined in [NotificationType].
@freezed
class Notification with _$Notification {
  const Notification._();

  /// A notification that is sent to the user.
  ///
  /// Notifications are sent to the user when something happens that they should be informed about (e.g. somebody invites them to a plan).
  ///
  /// There are different types of notifications, that are defined in [NotificationType].
  factory Notification({
    /// The id of the notification.
    @JsonKey(name: 'notificationid') required int id,

    /// The type of the notification.
    ///
    /// Based on this, the [context] will be interpreted differently (see [Notification] for more details).
    @JsonKey(name: 'type') required NotificationType type,

    /// The id of the user that the notification is for.
    ///
    /// This will always be the id of the currently logged in user.
    @JsonKey(name: 'userid') required int userId,

    /// Additional information for the notification.
    ///
    /// This is interpreted differently based on the [type] (see [NotificationType] for more details).
    @JsonKey(name: 'info') int? context,

    /// The unix timestamp of when the notification was created.
    @JsonKey(name: 'timestamp') required int createdAtTimestamp,

    /// The unix timestamp of when the notification was read.
    @JsonKey(name: 'timestamp_read') required int readAtTimestamp,

    /// The read status of the notification as an integer.
    ///
    /// This is used internally by the API and should not be used by the client, use [read] instead.
    @JsonKey(name: 'status') required int readAsInt,
  }) = _Notification;

  /// Loads a notification from a json map.
  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);

  /// `true` if the notification was read, `false` otherwise.
  bool get read => readAsInt == 1;
}

/// Notification types
enum NotificationType {
  /// The notification is an invite to join somebodys plan.
  ///
  /// In this case the [Notification.context] will be the [PlanInvite.id] of the invite, that triggered the notification. TODO: Import PlanInvite, once implemented
  @JsonValue(0)
  invite,

  /// The notification informs the user that their invite was declined.
  ///
  /// In this case the [Notification.context] will be the [PlanInvite.id] of the invite, that triggered the notification. TODO: Import PlanInvite, once implemented
  @JsonValue(1)
  inviteDeclined,

  /// The notification informs the user that their invite was accepted.
  ///
  /// In this case the [Notification.context] will be the [PlanInvite.id] of the invite, that triggered the notification. TODO: Import PlanInvite, once implemented
  @JsonValue(2)
  inviteAccepted,

  /// The notification informs the user that somebody left their plan.
  ///
  /// In this case the [Notification.context] will be the [User.id] of the [User] that left the plan.
  @JsonValue(3)
  planLeft,

  /// The notification informs the user that they were removed from a shared plan
  ///
  /// In this case the [Notification.context] will be the [User.id] of the owner of the [Plan] the user was removed from. TODO: Import Plan, once implemented
  @JsonValue(4)
  planRemoved,

  /// The notification is a welcome message linking to the documentation.
  ///
  /// Sent at Registration.
  ///
  /// In this case the [Notification.context] will be `null`.
  @JsonValue(5)
  userRegistered,
}
