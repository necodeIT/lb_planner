// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['userid'] as int,
      username: json['username'] as String,
      firstname: json['firstname'] as String,
      lastname: json['lastname'] as String,
      capabilitiesBitMask: json['capabilities'] as int? ?? -1,
      themeName: json['themeName'] as String? ?? "",
      language: json['lang'] as String? ?? "",
      profileImageUrl: json['profileimageurl'] as String? ?? "",
      planId: json['planid'] as int? ?? -1,
      colorBlindnessString: json['colorblindness'] as String? ?? "",
      displayTaskCountInt: json['displaytaskcount'] as int? ?? 1,
      vintage: json['vintage'] as String? ?? "",
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'userid': instance.id,
      'username': instance.username,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'capabilities': instance.capabilitiesBitMask,
      'themeName': instance.themeName,
      'lang': instance.language,
      'profileimageurl': instance.profileImageUrl,
      'planid': instance.planId,
      'colorblindness': instance.colorBlindnessString,
      'displaytaskcount': instance.displayTaskCountInt,
      'vintage': instance.vintage,
    };
