// Package imports:
import 'package:color_blindness/color_blindness.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:lbplanner_engine/lbplanner_engine.dart';

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

    /// The vintage the user is in
    required String vintage,

    /// Url to the users moodle profile picture
    required String avatar,
    @Default(true) bool displayTaskCount,

    /// the language the user has selected
    @Default(Languages.restricted) Languages language,

    /// The access token of the user to access the api
    @Default('') String token,

    /// The theme the user has selected
    @Default("") String theme,

    /// The capabilities of the user
    @Default(<UserCapability>{}) Set<UserCapability> capabilities,

    /// The id of the plan the user is currently a member of
    @Default(-1) int planId,

    /// If this is true, this user contains no useful data and is invalid
    @Default(false) bool invalid,

    /// The colorblindness of the user
    @Default(ColorBlindnessType.none) ColorBlindnessType colorBlindness,
  }) = _User;

  /// Empty [User] with [invalid] set to true.
  ///
  /// This is used to indicate that the user is not logged in or is currently loading.
  factory User.invalid() => _InvalidUser();

  /// The full name of the user, consiting out of the [firstname] and the [lastname]
  String get fullname => "$firstname $lastname";

  /// User model from json
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

User _InvalidUser() => User(
      id: -1,
      username: "",
      firstname: "",
      lastname: "",
      avatar: "",
      language: Languages.en,
      theme: "",
      capabilities: {},
      invalid: true,
      planId: -1,
      vintage: "",
    );
