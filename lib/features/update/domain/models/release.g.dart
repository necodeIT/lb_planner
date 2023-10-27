// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'release.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Release _$$_ReleaseFromJson(Map<String, dynamic> json) => _$_Release(
      channel: $enumDecode(_$BuildChannelEnumMap, json['channel']),
      versionString: json['version'] as String,
      downloads:
          ReleaseDownloads.fromJson(json['downloads'] as Map<String, dynamic>),
      changelog: json['changelog'] as String,
    );

Map<String, dynamic> _$$_ReleaseToJson(_$_Release instance) =>
    <String, dynamic>{
      'channel': _$BuildChannelEnumMap[instance.channel]!,
      'version': instance.versionString,
      'downloads': instance.downloads,
      'changelog': instance.changelog,
    };

const _$BuildChannelEnumMap = {
  BuildChannel.dev: 'dev',
  BuildChannel.beta: 'beta',
  BuildChannel.stable: 'stable',
};
