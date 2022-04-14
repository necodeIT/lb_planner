// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Course _$$_CourseFromJson(Map<String, dynamic> json) => _$_Course(
      id: json['id'] as int,
      name: json['name'] as String,
      shortName: json['shortName'] as String,
      colorCode: json['colorCode'] as String,
      enabled: json['enabled'] as bool,
    );

Map<String, dynamic> _$$_CourseToJson(_$_Course instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'shortName': instance.shortName,
      'colorCode': instance.colorCode,
      'enabled': instance.enabled,
    };
