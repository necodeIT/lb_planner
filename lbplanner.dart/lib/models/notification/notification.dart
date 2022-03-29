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
    required int id,
    required Map<String, dynamic> payload,
    required NotifactionTypes type,
    required NotificationStatus status,
  }) = _Notification;

  /// Notification model from json
  factory Notification.fromJson(Map<String, dynamic> json) => _$NotificationFromJson(json);
}
