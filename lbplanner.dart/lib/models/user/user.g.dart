// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      username: json['username'] as String,
      firstname: json['firstname'] as String,
      lastname: json['lastname'] as String,
      avatar: Uri.parse(json['avatar'] as String),
      language: $enumDecode(_$LanguagesEnumMap, json['language']),
      theme: json['theme'] as String,
      accessLevel: $enumDecode(_$AccessLevelsEnumMap, json['accessLevel']),
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'username': instance.username,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'avatar': instance.avatar.toString(),
      'language': _$LanguagesEnumMap[instance.language],
      'theme': instance.theme,
      'accessLevel': _$AccessLevelsEnumMap[instance.accessLevel],
    };

const _$LanguagesEnumMap = {
  Languages.en: 'en',
};

const _$AccessLevelsEnumMap = {
  AccessLevels.admin: 'admin',
  AccessLevels.moderator: 'moderator',
  AccessLevels.teacher: 'teacher',
  AccessLevels.student: 'student',
};
