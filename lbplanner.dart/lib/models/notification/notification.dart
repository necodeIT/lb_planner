// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
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
    required NotificationTypes type,

    /// The status of the notification
    required NotificationStatus status,

    /// The date the notification was received
    required DateTime timestamp,

    /// The date the notification was read
    @Default(null) DateTime? readTimestamp,
  }) = _Notification;

  /// Notification model from json
  factory Notification.fromJson(Map<String, dynamic> json) => _$NotificationFromJson(json);
}
