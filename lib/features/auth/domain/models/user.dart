// ignore_for_file: invalid_annotation_target

import 'package:color_blindness/color_blindness.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

/// A user using the application.
@freezed
class User with _$User {
  const User._();

  /// A user using the application.
  factory User({
    /// The id of the user
    @JsonKey(name: 'userid') required int id,

    /// The username of the user
    required String username,

    /// The firstname of the user
    required String firstname,

    /// The lastname of the user
    required String lastname,

    /// A bitmask of the capabilities the user has
    @Default(-1) @JsonKey(name: 'capabilities') int capabilitiesBitMask,

    /// The name of the theme the user has selected
    @Default("") String themeName,

    /// The language the user has selected
    @Default("") @JsonKey(name: 'lang') String language,

    /// The url of the profile image
    @Default("") @JsonKey(name: 'profileimageurl') String profileImageUrl,

    /// The id of the plan the user is assigned to
    @Default(-1) @JsonKey(name: 'planid') int planId,

    /// The color blindness of the user as a string
    @Default("") @JsonKey(name: 'colorblindness') String colorBlindnessString,

    /// Whether to display the task count in the calendar view
    @Default(1) @JsonKey(name: 'displaytaskcount') int displayTaskCountInt,

    /// The vintage of the user
    @Default("") String vintage,
  }) = _User;

  /// Load a user from json
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// The capabilities the user has
  List<UserCapability> get capabilities {
    List<UserCapability> capabilities = [];

    for (UserCapability capability in UserCapability.values) {
      var mask = 1 << capability.index;

      if (capabilitiesBitMask & mask != 0) capabilities.add(capability);
    }

    return capabilities;
  }

  /// The [Locale] to use based on the user's [language].
  Locale get locale => _langToLocale[language] ?? _langToLocale.values.first;

  /// The [ColorBlindnessType] of  user based on [colorBlindnessString].
  ColorBlindnessType get colorBlindness =>
      ColorBlindnessType.values.byName(colorBlindnessString);

  /// Whether to display the task count in the calendar view or not.
  ///
  /// Based on [displayTaskCountInt].
  bool get displayTaskCount => displayTaskCountInt == 1;
}

const _langToLocale = {
  'en': Locale('en', 'US'),
  'de': Locale('de', 'DE'),
};

/// Represents the different capabilities a user can possess within the application.
///
/// Each capability grants the user specific access rights and features tailored to their role.
enum UserCapability {
  /// Users with this capability are members of the development team.
  ///
  /// They have exclusive access to development-specific features and statistics.
  ///
  /// This role is typically reserved for those involved in the app's development and maintenance.
  dev,

  /// Users with this capability act as moderators within the platform.
  ///
  /// For example, they have the authority to access and manage user feedback.
  ///
  /// and perform other moderation tasks.
  moderator,

  /// Teacher Capability
  ///
  /// Users with this capability are recognized as teachers or educators.
  ///
  /// They have access to features that allow them to e.g. manage and create time slots.
  teacher,

  /// Users with this capability are identified as students or learners.
  ///
  /// They can access features tailored to their planning experience (e.g. the calendar view)
  student,
}

/// Provides helper methods for [List<UserCapability>].
extension UserCapabilitiesExtension on List<UserCapability> {
  /// Returns `true` if [UserCapability.dev] is one of the capabilities the user has. Otherwise `false`.
  bool get hasDev => contains(UserCapability.dev);

  /// Returns `true` if the list contains [UserCapability.moderator]. Otherwise `false`.
  bool get hasModerator => contains(UserCapability.moderator);

  /// Returns `true` if the list contains [UserCapability.teacher]. Otherwise `false`.
  bool get hasTeacher => contains(UserCapability.teacher);

  /// Returns `true` if the list contains [UserCapability.student]. Otherwise `false`.
  bool get hasStudent => contains(UserCapability.student);
}

/// Provides helper methods for [UserCapability].
extension UserCapabilityExtension on UserCapability {
  /// Returns `true` if this capability is [UserCapability.dev]. Otherwise `false`.
  bool get isDev => this == UserCapability.dev;

  /// Returns `true` if this capability is [UserCapability.moderator]. Otherwise `false`.
  bool get isModerator => this == UserCapability.moderator;

  /// Returns `true` if this capability is [UserCapability.teacher]. Otherwise `false`.
  bool get isTeacher => this == UserCapability.teacher;

  /// Returns `true` if this capability is [UserCapability.student]. Otherwise `false`.
  bool get isStudent => this == UserCapability.student;
}
