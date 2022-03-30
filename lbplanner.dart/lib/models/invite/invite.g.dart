// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PlanInvite _$$_PlanInviteFromJson(Map<String, dynamic> json) =>
    _$_PlanInvite(
      id: json['id'] as int,
      planId: json['planId'] as int,
      invitee: User.fromJson(json['invitee'] as Map<String, dynamic>),
      inviter: User.fromJson(json['inviter'] as Map<String, dynamic>),
      status: $enumDecode(_$PlanInviteStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$_PlanInviteToJson(_$_PlanInvite instance) =>
    <String, dynamic>{
      'id': instance.id,
      'planId': instance.planId,
      'invitee': instance.invitee,
      'inviter': instance.inviter,
      'status': _$PlanInviteStatusEnumMap[instance.status],
    };

const _$PlanInviteStatusEnumMap = {
  PlanInviteStatus.pending: 'pending',
  PlanInviteStatus.accepted: 'accepted',
  PlanInviteStatus.declined: 'declined',
};
