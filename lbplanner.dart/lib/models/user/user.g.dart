// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as int,
      username: json['username'] as String,
      firstname: json['firstname'] as String,
      lastname: json['lastname'] as String,
      avatar: json['avatar'] as String,
      language: $enumDecode(_$LanguagesEnumMap, json['language']),
      theme: json['theme'] as String,
      accessLevel: $enumDecode(_$AccessLevelsEnumMap, json['accessLevel']),
      planId: json['planId'] as int,
      isEmpty: json['isEmpty'] as bool? ?? false,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'avatar': instance.avatar,
      'language': _$LanguagesEnumMap[instance.language],
      'theme': instance.theme,
      'accessLevel': _$AccessLevelsEnumMap[instance.accessLevel],
      'planId': instance.planId,
      'isEmpty': instance.isEmpty,
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
