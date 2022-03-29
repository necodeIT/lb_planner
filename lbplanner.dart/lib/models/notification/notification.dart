import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lbplanner_api/lbplanner_api.dart';

part 'notification.freezed.dart';
part 'notification.g.dart';

@freezed

/// Notification model
class Notification with _$Notification {
  /// Notification model
  const factory Notification({
    /// ID of the notification
    required int id,

    /// The payload of the notification
    required Map<String, dynamic> payload,

    /// The type of the notification
    required NotifactionTypes type,

    /// The status of the notification
    required NotificationStatus status,
  }) = _Notification;

  /// Notification model from json
  factory Notification.fromJson(Map<String, dynamic> json) => _$NotificationFromJson(json);
}
