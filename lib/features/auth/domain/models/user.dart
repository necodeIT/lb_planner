// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

// TODO: finish user mapping from http response

/* 'userid' => $user->userid,
                'username' => $user->username,
                'firstname' => $mdluser->firstname,
                'lastname' => $mdluser->lastname,
                'capabilities' => null,
                'theme' => null,
                'lang' => null,
                'profileimageurl' => $mdluser->profileimageurl,
                'planid' => null,
                'colorblindness' => null,
                'displaytaskcount' => null,
                'vintage' => $mdluser->vintage,
  */

/*
  'userid' => new external_value(PARAM_INT, 'The id of the user'),
                'username' => new external_value(PARAM_TEXT, 'The username of the user'),
                'firstname' => new external_value(PARAM_TEXT, 'The firstname of the user'),
                'lastname' => new external_value(PARAM_TEXT, 'The lastname of the user'),
                'theme' => new external_value(PARAM_TEXT, 'The theme the user has selected'),
                'lang' => new external_value(PARAM_TEXT, 'The language the user has selected'),
                'profileimageurl' => new external_value(PARAM_URL, 'The url of the profile image'),
                'planid' => new external_value(PARAM_INT, 'The id of the plan the user is assigned to'),
                'colorblindness' => new external_value(PARAM_TEXT, 'The colorblindness of the user'),
                'displaytaskcount' => new external_value(PARAM_INT, 'The displaytaskcount of the user'),
                'capabilities' => new external_value(PARAM_INT, 'The capability'),
                'vintage' => new external_value(PARAM_TEXT, 'The vintage of the user')
                */
@freezed
class User with _$User {
  factory User({
    @JsonKey(name: 'userid') required int id,
    required String username,
    required String firstname,
    required String lastname,
    @Default(-1)
    @JsonKey(name: 'capabilities')
    required int capabilitiesBitMask,
    @Default("") String theme,
    @Default("") @JsonKey(name: 'lang') String language,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

enum UserCapabilities {
  admin,
  manager,
  teacher,
  student,
}
