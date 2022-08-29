// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PlanInvite _$$_PlanInviteFromJson(Map<String, dynamic> json) =>
    _$_PlanInvite(
      id: json['id'] as int,
      timeStamp: DateTime.parse(json['timeStamp'] as String),
      planId: json['planId'] as int,
      invitee: json['invitee'] as int,
      inviter: json['inviter'] as int,
      status: $enumDecode(_$PlanInviteStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$_PlanInviteToJson(_$_PlanInvite instance) =>
    <String, dynamic>{
      'id': instance.id,
      'timeStamp': instance.timeStamp.toIso8601String(),
      'planId': instance.planId,
      'invitee': instance.invitee,
      'inviter': instance.inviter,
      'status': _$PlanInviteStatusEnumMap[instance.status]!,
    };

const _$PlanInviteStatusEnumMap = {
  PlanInviteStatus.pending: 'pending',
  PlanInviteStatus.accepted: 'accepted',
  PlanInviteStatus.declined: 'declined',
  PlanInviteStatus.expired: 'expired',
};
