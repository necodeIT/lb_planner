// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Statistics _$$_StatisticsFromJson(Map<String, dynamic> json) =>
    _$_Statistics(
      totalModules: json['totalModules'] as int? ?? 0,
      lateModules: json['lateModules'] as int? ?? 0,
      pendingModules: json['pendingModules'] as int? ?? 0,
      completedModules: json['completedModules'] as int? ?? 0,
      uploadedModules: json['uploadedModules'] as int? ?? 0,
      courseStats: (json['courseStats'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(
                int.parse(k), Statistics.fromJson(e as Map<String, dynamic>)),
          ) ??
          const [],
    );

Map<String, dynamic> _$$_StatisticsToJson(_$_Statistics instance) =>
    <String, dynamic>{
      'totalModules': instance.totalModules,
      'lateModules': instance.lateModules,
      'pendingModules': instance.pendingModules,
      'completedModules': instance.completedModules,
      'uploadedModules': instance.uploadedModules,
      'courseStats':
          instance.courseStats.map((k, e) => MapEntry(k.toString(), e)),
    };
