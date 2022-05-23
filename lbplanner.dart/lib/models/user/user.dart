// Package imports:
import 'package:color_blindness/color_blindness.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:lbplanner_api/lbplanner_api.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed

/// User model
class User with _$User {
  const User._();

  /// User model
  const factory User({
    /// ID of the user
    required int id,

    /// Name of the user
    required String username,

    /// User's first name
    required String firstname,

    /// Lastname of the user
    required String lastname,

    /// Url to the users moodle profile picture
    required String avatar,

    /// the language the user has selected
    @Default(Languages.restricted) Languages language,

    /// The access token of the user to access the api
    @Default('') String token,

    /// The theme the user has selected
    @Default("") String theme,

    /// The access level of the user
    @Default(UserAccessLevels.restricted) UserAccessLevels accessLevel,

    /// The id of the plan the user is currently a member of
    @Default(-1) int planId,

    /// If this is set to true the this user contains no useful data and is loading
    @Default(false) bool loading,

    /// The colorblindness of the user
    @Default(ColorBlindnessType.none) ColorBlindnessType colorBlindness,
  }) = _User;

  /// Empty [User] with [loading] set to true.
  /// This is used to indicate that the user is not logged in or is currently loading.
  factory User.loading() => _LoadingUser();

  /// If this is true, only restricted information is available about this user
  bool get restricted => accessLevel == UserAccessLevels.restricted;

  /// The full name of the user, consiting out of the [firstname] and the [lastname]
  String get fullname => "$firstname $lastname";

  /// User model from json
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

User _LoadingUser() => User(
      id: -1,
      username: "",
      firstname: "",
      lastname: "",
      avatar: "",
      language: Languages.en,
      theme: "",
      accessLevel: UserAccessLevels.restricted,
      loading: true,
      planId: -1,
    );
