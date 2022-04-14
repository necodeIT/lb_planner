// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Plan _$$_PlanFromJson(Map<String, dynamic> json) => _$_Plan(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      members: (json['members'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(int.parse(k), $enumDecode(_$PlanAccessTypesEnumMap, e)),
      ),
      deadlines: (json['deadlines'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            int.parse(k), Deadline.fromJson(e as Map<String, dynamic>)),
      ),
      enableEk: json['enableEk'] as bool,
      invites: (json['invites'] as List<dynamic>?)
              ?.map((e) => PlanInvite.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_PlanToJson(_$_Plan instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'members': instance.members
          .map((k, e) => MapEntry(k.toString(), _$PlanAccessTypesEnumMap[e])),
      'deadlines': instance.deadlines.map((k, e) => MapEntry(k.toString(), e)),
      'enableEk': instance.enableEk,
      'invites': instance.invites,
    };

const _$PlanAccessTypesEnumMap = {
  PlanAccessTypes.owner: 'owner',
  PlanAccessTypes.write: 'write',
  PlanAccessTypes.read: 'read',
};
