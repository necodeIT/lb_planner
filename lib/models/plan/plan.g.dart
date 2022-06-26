// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Plan _$$_PlanFromJson(Map<String, dynamic> json) => _$_Plan(
      id: json['id'] as int,
      name: json['name'] as String,
      members: (json['members'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(int.parse(k), $enumDecode(_$PlanAccessLevelsEnumMap, e)),
      ),
      deadlines: (json['deadlines'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            int.parse(k), Deadline.fromJson(e as Map<String, dynamic>)),
      ),
      ekEnabled: json['ekEnabled'] as bool,
      loading: json['loading'] as bool? ?? false,
    );

Map<String, dynamic> _$$_PlanToJson(_$_Plan instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'members': instance.members
          .map((k, e) => MapEntry(k.toString(), _$PlanAccessLevelsEnumMap[e])),
      'deadlines': instance.deadlines.map((k, e) => MapEntry(k.toString(), e)),
      'ekEnabled': instance.ekEnabled,
      'loading': instance.loading,
    };

const _$PlanAccessLevelsEnumMap = {
  PlanAccessLevels.owner: 'owner',
  PlanAccessLevels.write: 'write',
  PlanAccessLevels.read: 'read',
};
