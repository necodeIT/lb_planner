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
      language: $enumDecodeNullable(_$LanguagesEnumMap, json['language']) ??
          Languages.restricted,
      token: json['token'] as String? ?? '',
      theme: json['theme'] as String? ?? "",
      accessLevel:
          $enumDecodeNullable(_$UserAccessLevelsEnumMap, json['accessLevel']) ??
              UserAccessLevels.restricted,
      planId: json['planId'] as int? ?? -1,
      loading: json['loading'] as bool? ?? false,
      colorBlindness: $enumDecodeNullable(
              _$ColorBlindnessTypeEnumMap, json['colorBlindness']) ??
          ColorBlindnessType.none,
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
      'accessLevel': _$UserAccessLevelsEnumMap[instance.accessLevel],
      'planId': instance.planId,
      'loading': instance.loading,
      'colorBlindness': _$ColorBlindnessTypeEnumMap[instance.colorBlindness],
    };

const _$LanguagesEnumMap = {
  Languages.en: 'en',
  Languages.restricted: 'restricted',
};

const _$UserAccessLevelsEnumMap = {
  UserAccessLevels.admin: 'admin',
  UserAccessLevels.moderator: 'moderator',
  UserAccessLevels.teacher: 'teacher',
  UserAccessLevels.student: 'student',
  UserAccessLevels.restricted: 'restricted',
};

const _$ColorBlindnessTypeEnumMap = {
  ColorBlindnessType.none: 'none',
  ColorBlindnessType.protanomaly: 'protanomaly',
  ColorBlindnessType.deuteranomaly: 'deuteranomaly',
  ColorBlindnessType.tritanomaly: 'tritanomaly',
  ColorBlindnessType.protanopia: 'protanopia',
  ColorBlindnessType.deuteranopia: 'deuteranopia',
  ColorBlindnessType.tritanopia: 'tritanopia',
  ColorBlindnessType.achromatopsia: 'achromatopsia',
  ColorBlindnessType.achromatomaly: 'achromatomaly',
};
