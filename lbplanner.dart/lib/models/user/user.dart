// Package imports:
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

    /// If this is set to true the this user contains no useful data
    @Default(false) bool isEmpty,
  }) = _User;

  /// Empty [User] with [isEmpty] set to true.
  /// This is used to indicate that the user is not logged in and contains no valuable information other than that.
  factory User.empty() => _EmptyUser();

  /// If this is true, only restricted information is available about this user
  bool get restricted => accessLevel == UserAccessLevels.restricted;

  /// User model from json
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

User _EmptyUser() => User(
      id: -1,
      username: "",
      firstname: "",
      lastname: "",
      avatar: "",
      language: Languages.en,
      theme: "",
      accessLevel: UserAccessLevels.restricted,
      isEmpty: true,
      planId: -1,
    );
