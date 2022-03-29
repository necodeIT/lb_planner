import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lbplanner_api/lbplanner_api.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed

/// User model
class User with _$User {
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
    required Languages language,

    /// The theme the user has selected
    required String theme,

    /// The access level of the user
    required AccessLevels accessLevel,

    /// The id of the plan the user is currently a member of
    required int planId,

    /// If this is set to true the this user contains no useful data
    @Default(false) bool isEmpty,
  }) = _User;

  /// Empty [User] with [isEmpty] set to true.
  /// This is used to indicate that the user is not logged in and contains no valuable information other than that.
  factory User.empty() => _EmptyUser();

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
      accessLevel: AccessLevels.student,
      isEmpty: true,
      planId: -1,
    );
