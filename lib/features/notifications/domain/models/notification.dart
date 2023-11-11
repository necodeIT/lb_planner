import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lb_planner/shared/domain/domain.dart';

part 'notification.freezed.dart';
part 'notification.g.dart';

@freezed
class Notification with _$Notification {
  factory Notification({
    @JsonKey(name: 'notificationid') required int id,
    @JsonKey(name: 'type') required int typeAsInt,
    @JsonKey(name: 'userid') required int userId,
    required JSON info,
    @JsonKey(name: 'timestamp') required int createdAtTimestamp,
    @JsonKey(name: 'timestamp_read') required int readAtTimestamp,
    @JsonKey(name: 'status') required int readAsInt,
  }) = _Notification;

  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);
}
