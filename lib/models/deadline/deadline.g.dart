// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deadline.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Deadline _$$_DeadlineFromJson(Map<String, dynamic> json) => _$_Deadline(
      moduleId: json['moduleId'] as int,
      start: DateTime.parse(json['start'] as String),
      end: DateTime.parse(json['end'] as String),
    );

Map<String, dynamic> _$$_DeadlineToJson(_$_Deadline instance) =>
    <String, dynamic>{
      'moduleId': instance.moduleId,
      'start': instance.start.toIso8601String(),
      'end': instance.end.toIso8601String(),
    };
