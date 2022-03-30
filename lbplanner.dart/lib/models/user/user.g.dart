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
      language: $enumDecodeNullable(_$LanguagesEnumMap, json['language']) ?? Languages.restricted,
      token: json['token'] as String? ?? '',
      theme: json['theme'] as String? ?? "",
      accessLevel: $enumDecodeNullable(_$AccessLevelsEnumMap, json['accessLevel']) ?? UserAccessLevels.restricted,
      planId: json['planId'] as int? ?? -1,
      isEmpty: json['isEmpty'] as bool? ?? false,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'avatar': instance.avatar,
      'language': _$LanguagesEnumMap[instance.language],
      'token': instance.token,
      'theme': instance.theme,
      'accessLevel': _$AccessLevelsEnumMap[instance.accessLevel],
      'planId': instance.planId,
      'isEmpty': instance.isEmpty,
    };

const _$LanguagesEnumMap = {
  Languages.en: 'en',
  Languages.restricted: 'restricted',
};

const _$AccessLevelsEnumMap = {
  UserAccessLevels.admin: 'admin',
  UserAccessLevels.moderator: 'moderator',
  UserAccessLevels.teacher: 'teacher',
  UserAccessLevels.student: 'student',
  UserAccessLevels.restricted: 'restricted',
};
