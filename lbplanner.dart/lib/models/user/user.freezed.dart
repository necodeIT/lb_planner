// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
class _$UserTearOff {
  const _$UserTearOff();

  _User call(
      {required int id,
      required String username,
      required String firstname,
      required String lastname,
      required String avatar,
      Languages language = Languages.restricted,
      String theme = "",
      AccessLevels accessLevel = AccessLevels.restricted,
      int planId = -1,
      bool isEmpty = false}) {
    return _User(
      id: id,
      username: username,
      firstname: firstname,
      lastname: lastname,
      avatar: avatar,
      language: language,
      theme: theme,
      accessLevel: accessLevel,
      planId: planId,
      isEmpty: isEmpty,
    );
  }

  User fromJson(Map<String, Object?> json) {
    return User.fromJson(json);
  }
}

/// @nodoc
const $User = _$UserTearOff();

/// @nodoc
mixin _$User {
  /// ID of the user
  int get id => throw _privateConstructorUsedError;

  /// Name of the user
  String get username => throw _privateConstructorUsedError;

  /// User's first name
  String get firstname => throw _privateConstructorUsedError;

  /// Lastname of the user
  String get lastname => throw _privateConstructorUsedError;

  /// Url to the users moodle profile picture
  String get avatar => throw _privateConstructorUsedError;

  /// the language the user has selected
  Languages get language => throw _privateConstructorUsedError;

  /// The theme the user has selected
  String get theme => throw _privateConstructorUsedError;

  /// The access level of the user
  AccessLevels get accessLevel => throw _privateConstructorUsedError;

  /// The id of the plan the user is currently a member of
  int get planId => throw _privateConstructorUsedError;

  /// If this is set to true the this user contains no useful data
  bool get isEmpty => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) = _$UserCopyWithImpl<$Res>;
  $Res call({int id, String username, String firstname, String lastname, String avatar, Languages language, String theme, AccessLevels accessLevel, int planId, bool isEmpty});
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? firstname = freezed,
    Object? lastname = freezed,
    Object? avatar = freezed,
    Object? language = freezed,
    Object? theme = freezed,
    Object? accessLevel = freezed,
    Object? planId = freezed,
    Object? isEmpty = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      firstname: firstname == freezed
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String,
      lastname: lastname == freezed
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: avatar == freezed
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      language: language == freezed
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as Languages,
      theme: theme == freezed
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String,
      accessLevel: accessLevel == freezed
          ? _value.accessLevel
          : accessLevel // ignore: cast_nullable_to_non_nullable
              as AccessLevels,
      planId: planId == freezed
          ? _value.planId
          : planId // ignore: cast_nullable_to_non_nullable
              as int,
      isEmpty: isEmpty == freezed
          ? _value.isEmpty
          : isEmpty // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) then) = __$UserCopyWithImpl<$Res>;
  @override
  $Res call({int id, String username, String firstname, String lastname, String avatar, Languages language, String theme, AccessLevels accessLevel, int planId, bool isEmpty});
}

/// @nodoc
class __$UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res> implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(_User _value, $Res Function(_User) _then) : super(_value, (v) => _then(v as _User));

  @override
  _User get _value => super._value as _User;

  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? firstname = freezed,
    Object? lastname = freezed,
    Object? avatar = freezed,
    Object? language = freezed,
    Object? theme = freezed,
    Object? accessLevel = freezed,
    Object? planId = freezed,
    Object? isEmpty = freezed,
  }) {
    return _then(_User(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      firstname: firstname == freezed
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String,
      lastname: lastname == freezed
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: avatar == freezed
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      language: language == freezed
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as Languages,
      theme: theme == freezed
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String,
      accessLevel: accessLevel == freezed
          ? _value.accessLevel
          : accessLevel // ignore: cast_nullable_to_non_nullable
              as AccessLevels,
      planId: planId == freezed
          ? _value.planId
          : planId // ignore: cast_nullable_to_non_nullable
              as int,
      isEmpty: isEmpty == freezed
          ? _value.isEmpty
          : isEmpty // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User extends _User {
  const _$_User(
      {required this.id,
      required this.username,
      required this.firstname,
      required this.lastname,
      required this.avatar,
      this.language = Languages.restricted,
      this.theme = "",
      this.accessLevel = AccessLevels.restricted,
      this.planId = -1,
      this.isEmpty = false})
      : super._();

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override

  /// ID of the user
  final int id;
  @override

  /// Name of the user
  final String username;
  @override

  /// User's first name
  final String firstname;
  @override

  /// Lastname of the user
  final String lastname;
  @override

  /// Url to the users moodle profile picture
  final String avatar;
  @JsonKey()
  @override

  /// the language the user has selected
  final Languages language;
  @JsonKey()
  @override

  /// The theme the user has selected
  final String theme;
  @JsonKey()
  @override

  /// The access level of the user
  final AccessLevels accessLevel;
  @JsonKey()
  @override

  /// The id of the plan the user is currently a member of
  final int planId;
  @JsonKey()
  @override

  /// If this is set to true the this user contains no useful data
  final bool isEmpty;

  @override
  String toString() {
    return 'User(id: $id, username: $username, firstname: $firstname, lastname: $lastname, avatar: $avatar, language: $language, theme: $theme, accessLevel: $accessLevel, planId: $planId, isEmpty: $isEmpty)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _User &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.username, username) &&
            const DeepCollectionEquality().equals(other.firstname, firstname) &&
            const DeepCollectionEquality().equals(other.lastname, lastname) &&
            const DeepCollectionEquality().equals(other.avatar, avatar) &&
            const DeepCollectionEquality().equals(other.language, language) &&
            const DeepCollectionEquality().equals(other.theme, theme) &&
            const DeepCollectionEquality().equals(other.accessLevel, accessLevel) &&
            const DeepCollectionEquality().equals(other.planId, planId) &&
            const DeepCollectionEquality().equals(other.isEmpty, isEmpty));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(username),
      const DeepCollectionEquality().hash(firstname),
      const DeepCollectionEquality().hash(lastname),
      const DeepCollectionEquality().hash(avatar),
      const DeepCollectionEquality().hash(language),
      const DeepCollectionEquality().hash(theme),
      const DeepCollectionEquality().hash(accessLevel),
      const DeepCollectionEquality().hash(planId),
      const DeepCollectionEquality().hash(isEmpty));

  @JsonKey(ignore: true)
  @override
  _$UserCopyWith<_User> get copyWith => __$UserCopyWithImpl<_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(this);
  }
}

abstract class _User extends User {
  const factory _User({required int id, required String username, required String firstname, required String lastname, required String avatar, Languages language, String theme, AccessLevels accessLevel, int planId, bool isEmpty}) = _$_User;
  const _User._() : super._();

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override

  /// ID of the user
  int get id;
  @override

  /// Name of the user
  String get username;
  @override

  /// User's first name
  String get firstname;
  @override

  /// Lastname of the user
  String get lastname;
  @override

  /// Url to the users moodle profile picture
  String get avatar;
  @override

  /// the language the user has selected
  Languages get language;
  @override

  /// The theme the user has selected
  String get theme;
  @override

  /// The access level of the user
  AccessLevels get accessLevel;
  @override

  /// The id of the plan the user is currently a member of
  int get planId;
  @override

  /// If this is set to true the this user contains no useful data
  bool get isEmpty;
  @override
  @JsonKey(ignore: true)
  _$UserCopyWith<_User> get copyWith => throw _privateConstructorUsedError;
}
