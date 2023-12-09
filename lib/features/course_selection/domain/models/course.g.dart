// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Course _$$_CourseFromJson(Map<String, dynamic> json) => _$_Course(
      id: json['courseid'] as int,
      colorCode: json['color'] as String,
      shortName: json['shortname'] as String,
      isEnabled: json['enabled'] as bool,
    );

Map<String, dynamic> _$$_CourseToJson(_$_Course instance) => <String, dynamic>{
      'courseid': instance.id,
      'color': instance.colorCode,
      'shortname': instance.shortName,
      'enabled': instance.isEnabled,
    };
