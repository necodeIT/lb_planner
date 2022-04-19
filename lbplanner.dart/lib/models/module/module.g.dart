// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'module.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Module _$$_ModuleFromJson(Map<String, dynamic> json) => _$_Module(
      id: json['id'] as int,
      name: json['name'] as String,
      url: json['url'] as String,
      deadline: json['deadline'] == null
          ? null
          : DateTime.parse(json['deadline'] as String),
      hidden: json['hidden'] as bool? ?? false,
      grade: $enumDecodeNullable(_$ModuleGradesEnumMap, json['grade']),
      type: $enumDecode(_$ModuleTypesEnumMap, json['type']),
      status: $enumDecode(_$ModuleStatusEnumMap, json['status']),
      courseId: json['courseId'] as int,
    );

Map<String, dynamic> _$$_ModuleToJson(_$_Module instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'url': instance.url,
      'deadline': instance.deadline?.toIso8601String(),
      'hidden': instance.hidden,
      'grade': _$ModuleGradesEnumMap[instance.grade],
      'type': _$ModuleTypesEnumMap[instance.type],
      'status': _$ModuleStatusEnumMap[instance.status],
      'courseId': instance.courseId,
    };

const _$ModuleGradesEnumMap = {
  ModuleGrades.ekv: 'ekv',
  ModuleGrades.ek: 'ek',
  ModuleGrades.gkv: 'gkv',
  ModuleGrades.gk: 'gk',
  ModuleGrades.rip: 'rip',
};

const _$ModuleTypesEnumMap = {
  ModuleTypes.gk: 'gk',
  ModuleTypes.ek: 'ek',
  ModuleTypes.test: 'test',
};

const _$ModuleStatusEnumMap = {
  ModuleStatus.done: 'done',
  ModuleStatus.uploaded: 'uploaded',
  ModuleStatus.late: 'late',
  ModuleStatus.pending: 'pending',
};
