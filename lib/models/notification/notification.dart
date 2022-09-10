// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:lbplanner_engine/lbplanner_engine.dart';

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
    int? payload,

    /// The type of the notification
    required NotificationTypes type,

    /// The status of the notification
    required NotificationStatus status,

    /// The date the notification was received
    required DateTime timestamp,

    /// The date the notification was read
    DateTime? readTimestamp,
  }) = _Notification;

  /// Notification model from json
  factory Notification.fromJson(Map<String, dynamic> json) => _$NotificationFromJson(json);
}
