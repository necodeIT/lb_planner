// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Notification _$$_NotificationFromJson(Map<String, dynamic> json) =>
    _$_Notification(
      id: json['notificationid'] as int,
      type: $enumDecode(_$NotificationTypeEnumMap, json['type']),
      userId: json['userid'] as int,
      context: json['info'] as int?,
      createdAtTimestamp: json['timestamp'] as int,
      readAtTimestamp: json['timestamp_read'] as int,
      readAsInt: json['status'] as int,
    );

Map<String, dynamic> _$$_NotificationToJson(_$_Notification instance) =>
    <String, dynamic>{
      'notificationid': instance.id,
      'type': _$NotificationTypeEnumMap[instance.type]!,
      'userid': instance.userId,
      'info': instance.context,
      'timestamp': instance.createdAtTimestamp,
      'timestamp_read': instance.readAtTimestamp,
      'status': instance.readAsInt,
    };

const _$NotificationTypeEnumMap = {
  NotificationType.invite: 0,
  NotificationType.inviteDeclined: 1,
  NotificationType.inviteAccepted: 2,
  NotificationType.planLeft: 3,
  NotificationType.planRemoved: 4,
  NotificationType.userRegistered: 5,
};
