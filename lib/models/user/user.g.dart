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
      displayTaskCount: json['displayTaskCount'] as bool? ?? true,
      language: $enumDecodeNullable(_$LanguagesEnumMap, json['language']) ??
          Languages.restricted,
      token: json['token'] as String? ?? '',
      theme: json['theme'] as String? ?? "",
      capabilities: (json['capabilities'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$UserCapabilityEnumMap, e))
              .toSet() ??
          const <UserCapability>{},
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
      'displayTaskCount': instance.displayTaskCount,
      'language': _$LanguagesEnumMap[instance.language]!,
      'token': instance.token,
      'theme': instance.theme,
      'capabilities': instance.capabilities
          .map((e) => _$UserCapabilityEnumMap[e]!)
          .toList(),
      'planId': instance.planId,
      'loading': instance.loading,
      'colorBlindness': _$ColorBlindnessTypeEnumMap[instance.colorBlindness]!,
    };

const _$LanguagesEnumMap = {
  Languages.en: 'en',
  Languages.restricted: 'restricted',
};

const _$UserCapabilityEnumMap = {
  UserCapability.admin: 'admin',
  UserCapability.moderator: 'moderator',
  UserCapability.teacher: 'teacher',
  UserCapability.student: 'student',
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
