// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  /// The id of the user
  @JsonKey(name: 'userid')
  int get id => throw _privateConstructorUsedError;

  /// The username of the user
  String get username => throw _privateConstructorUsedError;

  /// The firstname of the user
  String get firstname => throw _privateConstructorUsedError;

  /// The lastname of the user
  String get lastname => throw _privateConstructorUsedError;

  /// A bitmask of the capabilities the user has
  @JsonKey(name: 'capabilities')
  int get capabilitiesBitMask => throw _privateConstructorUsedError;

  /// The name of the theme the user has selected
  String get themeName => throw _privateConstructorUsedError;

  /// The language the user has selected
  @JsonKey(name: 'lang')
  String get language => throw _privateConstructorUsedError;

  /// The url of the profile image
  @JsonKey(name: 'profileimageurl')
  String get profileImageUrl => throw _privateConstructorUsedError;

  /// The id of the plan the user is assigned to
  @JsonKey(name: 'planid')
  int get planId => throw _privateConstructorUsedError;

  /// The color blindness of the user as a string
  @JsonKey(name: 'colorblindness')
  String get colorBlindnessString => throw _privateConstructorUsedError;

  /// Whether to display the task count in the calendar view
  @JsonKey(name: 'displaytaskcount')
  int get displayTaskCountInt => throw _privateConstructorUsedError;

  /// The vintage of the user
  String get vintage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {@JsonKey(name: 'userid') int id,
      String username,
      String firstname,
      String lastname,
      @JsonKey(name: 'capabilities') int capabilitiesBitMask,
      String themeName,
      @JsonKey(name: 'lang') String language,
      @JsonKey(name: 'profileimageurl') String profileImageUrl,
      @JsonKey(name: 'planid') int planId,
      @JsonKey(name: 'colorblindness') String colorBlindnessString,
      @JsonKey(name: 'displaytaskcount') int displayTaskCountInt,
      String vintage});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? firstname = null,
    Object? lastname = null,
    Object? capabilitiesBitMask = null,
    Object? themeName = null,
    Object? language = null,
    Object? profileImageUrl = null,
    Object? planId = null,
    Object? colorBlindnessString = null,
    Object? displayTaskCountInt = null,
    Object? vintage = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      firstname: null == firstname
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String,
      lastname: null == lastname
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String,
      capabilitiesBitMask: null == capabilitiesBitMask
          ? _value.capabilitiesBitMask
          : capabilitiesBitMask // ignore: cast_nullable_to_non_nullable
              as int,
      themeName: null == themeName
          ? _value.themeName
          : themeName // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      profileImageUrl: null == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      planId: null == planId
          ? _value.planId
          : planId // ignore: cast_nullable_to_non_nullable
              as int,
      colorBlindnessString: null == colorBlindnessString
          ? _value.colorBlindnessString
          : colorBlindnessString // ignore: cast_nullable_to_non_nullable
              as String,
      displayTaskCountInt: null == displayTaskCountInt
          ? _value.displayTaskCountInt
          : displayTaskCountInt // ignore: cast_nullable_to_non_nullable
              as int,
      vintage: null == vintage
          ? _value.vintage
          : vintage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) =
      __$$_UserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'userid') int id,
      String username,
      String firstname,
      String lastname,
      @JsonKey(name: 'capabilities') int capabilitiesBitMask,
      String themeName,
      @JsonKey(name: 'lang') String language,
      @JsonKey(name: 'profileimageurl') String profileImageUrl,
      @JsonKey(name: 'planid') int planId,
      @JsonKey(name: 'colorblindness') String colorBlindnessString,
      @JsonKey(name: 'displaytaskcount') int displayTaskCountInt,
      String vintage});
}

/// @nodoc
class __$$_UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res, _$_User>
    implements _$$_UserCopyWith<$Res> {
  __$$_UserCopyWithImpl(_$_User _value, $Res Function(_$_User) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? firstname = null,
    Object? lastname = null,
    Object? capabilitiesBitMask = null,
    Object? themeName = null,
    Object? language = null,
    Object? profileImageUrl = null,
    Object? planId = null,
    Object? colorBlindnessString = null,
    Object? displayTaskCountInt = null,
    Object? vintage = null,
  }) {
    return _then(_$_User(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      firstname: null == firstname
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String,
      lastname: null == lastname
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String,
      capabilitiesBitMask: null == capabilitiesBitMask
          ? _value.capabilitiesBitMask
          : capabilitiesBitMask // ignore: cast_nullable_to_non_nullable
              as int,
      themeName: null == themeName
          ? _value.themeName
          : themeName // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      profileImageUrl: null == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      planId: null == planId
          ? _value.planId
          : planId // ignore: cast_nullable_to_non_nullable
              as int,
      colorBlindnessString: null == colorBlindnessString
          ? _value.colorBlindnessString
          : colorBlindnessString // ignore: cast_nullable_to_non_nullable
              as String,
      displayTaskCountInt: null == displayTaskCountInt
          ? _value.displayTaskCountInt
          : displayTaskCountInt // ignore: cast_nullable_to_non_nullable
              as int,
      vintage: null == vintage
          ? _value.vintage
          : vintage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User extends _User {
  _$_User(
      {@JsonKey(name: 'userid') required this.id,
      required this.username,
      required this.firstname,
      required this.lastname,
      @JsonKey(name: 'capabilities') this.capabilitiesBitMask = -1,
      this.themeName = "",
      @JsonKey(name: 'lang') this.language = "",
      @JsonKey(name: 'profileimageurl') this.profileImageUrl = "",
      @JsonKey(name: 'planid') this.planId = -1,
      @JsonKey(name: 'colorblindness') this.colorBlindnessString = "",
      @JsonKey(name: 'displaytaskcount') this.displayTaskCountInt = 1,
      this.vintage = ""})
      : super._();

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  /// The id of the user
  @override
  @JsonKey(name: 'userid')
  final int id;

  /// The username of the user
  @override
  final String username;

  /// The firstname of the user
  @override
  final String firstname;

  /// The lastname of the user
  @override
  final String lastname;

  /// A bitmask of the capabilities the user has
  @override
  @JsonKey(name: 'capabilities')
  final int capabilitiesBitMask;

  /// The name of the theme the user has selected
  @override
  @JsonKey()
  final String themeName;

  /// The language the user has selected
  @override
  @JsonKey(name: 'lang')
  final String language;

  /// The url of the profile image
  @override
  @JsonKey(name: 'profileimageurl')
  final String profileImageUrl;

  /// The id of the plan the user is assigned to
  @override
  @JsonKey(name: 'planid')
  final int planId;

  /// The color blindness of the user as a string
  @override
  @JsonKey(name: 'colorblindness')
  final String colorBlindnessString;

  /// Whether to display the task count in the calendar view
  @override
  @JsonKey(name: 'displaytaskcount')
  final int displayTaskCountInt;

  /// The vintage of the user
  @override
  @JsonKey()
  final String vintage;

  @override
  String toString() {
    return 'User(id: $id, username: $username, firstname: $firstname, lastname: $lastname, capabilitiesBitMask: $capabilitiesBitMask, themeName: $themeName, language: $language, profileImageUrl: $profileImageUrl, planId: $planId, colorBlindnessString: $colorBlindnessString, displayTaskCountInt: $displayTaskCountInt, vintage: $vintage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_User &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.firstname, firstname) ||
                other.firstname == firstname) &&
            (identical(other.lastname, lastname) ||
                other.lastname == lastname) &&
            (identical(other.capabilitiesBitMask, capabilitiesBitMask) ||
                other.capabilitiesBitMask == capabilitiesBitMask) &&
            (identical(other.themeName, themeName) ||
                other.themeName == themeName) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.profileImageUrl, profileImageUrl) ||
                other.profileImageUrl == profileImageUrl) &&
            (identical(other.planId, planId) || other.planId == planId) &&
            (identical(other.colorBlindnessString, colorBlindnessString) ||
                other.colorBlindnessString == colorBlindnessString) &&
            (identical(other.displayTaskCountInt, displayTaskCountInt) ||
                other.displayTaskCountInt == displayTaskCountInt) &&
            (identical(other.vintage, vintage) || other.vintage == vintage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      username,
      firstname,
      lastname,
      capabilitiesBitMask,
      themeName,
      language,
      profileImageUrl,
      planId,
      colorBlindnessString,
      displayTaskCountInt,
      vintage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserCopyWith<_$_User> get copyWith =>
      __$$_UserCopyWithImpl<_$_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(
      this,
    );
  }
}

abstract class _User extends User {
  factory _User(
      {@JsonKey(name: 'userid') required final int id,
      required final String username,
      required final String firstname,
      required final String lastname,
      @JsonKey(name: 'capabilities') final int capabilitiesBitMask,
      final String themeName,
      @JsonKey(name: 'lang') final String language,
      @JsonKey(name: 'profileimageurl') final String profileImageUrl,
      @JsonKey(name: 'planid') final int planId,
      @JsonKey(name: 'colorblindness') final String colorBlindnessString,
      @JsonKey(name: 'displaytaskcount') final int displayTaskCountInt,
      final String vintage}) = _$_User;
  _User._() : super._();

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override

  /// The id of the user
  @JsonKey(name: 'userid')
  int get id;
  @override

  /// The username of the user
  String get username;
  @override

  /// The firstname of the user
  String get firstname;
  @override

  /// The lastname of the user
  String get lastname;
  @override

  /// A bitmask of the capabilities the user has
  @JsonKey(name: 'capabilities')
  int get capabilitiesBitMask;
  @override

  /// The name of the theme the user has selected
  String get themeName;
  @override

  /// The language the user has selected
  @JsonKey(name: 'lang')
  String get language;
  @override

  /// The url of the profile image
  @JsonKey(name: 'profileimageurl')
  String get profileImageUrl;
  @override

  /// The id of the plan the user is assigned to
  @JsonKey(name: 'planid')
  int get planId;
  @override

  /// The color blindness of the user as a string
  @JsonKey(name: 'colorblindness')
  String get colorBlindnessString;
  @override

  /// Whether to display the task count in the calendar view
  @JsonKey(name: 'displaytaskcount')
  int get displayTaskCountInt;
  @override

  /// The vintage of the user
  String get vintage;
  @override
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
}
