// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'version.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Version _$$_VersionFromJson(Map<String, dynamic> json) => _$_Version(
      major: json['major'] as int,
      minor: json['minor'] as int,
      patch: json['patch'] as int,
      build: json['build'] as int? ?? 0,
    );

Map<String, dynamic> _$$_VersionToJson(_$_Version instance) =>
    <String, dynamic>{
      'major': instance.major,
      'minor': instance.minor,
      'patch': instance.patch,
      'build': instance.build,
    };
