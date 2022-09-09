// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Notification _$$_NotificationFromJson(Map<String, dynamic> json) =>
    _$_Notification(
      id: json['id'] as int,
      payload: json['payload'] as int,
      type: $enumDecode(_$NotificationTypesEnumMap, json['type']),
      status: $enumDecode(_$NotificationStatusEnumMap, json['status']),
      timestamp: DateTime.parse(json['timestamp'] as String),
      readTimestamp: json['readTimestamp'] == null
          ? null
          : DateTime.parse(json['readTimestamp'] as String),
    );

Map<String, dynamic> _$$_NotificationToJson(_$_Notification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'payload': instance.payload,
      'type': _$NotificationTypesEnumMap[instance.type]!,
      'status': _$NotificationStatusEnumMap[instance.status]!,
      'timestamp': instance.timestamp.toIso8601String(),
      'readTimestamp': instance.readTimestamp?.toIso8601String(),
    };

const _$NotificationTypesEnumMap = {
  NotificationTypes.invite: 'invite',
  NotificationTypes.inviteAccepted: 'inviteAccepted',
  NotificationTypes.inviteDeclined: 'inviteDeclined',
  NotificationTypes.planLeft: 'planLeft',
  NotificationTypes.planRemoved: 'planRemoved',
  NotificationTypes.userRegistered: 'userRegistered',
};

const _$NotificationStatusEnumMap = {
  NotificationStatus.unread: 'unread',
  NotificationStatus.read: 'read',
};
