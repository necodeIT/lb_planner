// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of lbplanner_api;

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

  _User call({required String username, required String firstname, required String lastname, required Uri avatar, required Languages language, required String theme, required AccessLevels accessLevel}) {
    return _User(
      username: username,
      firstname: firstname,
      lastname: lastname,
      avatar: avatar,
      language: language,
      theme: theme,
      accessLevel: accessLevel,
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
  String get username => throw _privateConstructorUsedError;
  String get firstname => throw _privateConstructorUsedError;
  String get lastname => throw _privateConstructorUsedError;
  Uri get avatar => throw _privateConstructorUsedError;
  Languages get language => throw _privateConstructorUsedError;
  String get theme => throw _privateConstructorUsedError;
  AccessLevels get accessLevel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) = _$UserCopyWithImpl<$Res>;
  $Res call({String username, String firstname, String lastname, Uri avatar, Languages language, String theme, AccessLevels accessLevel});
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object? username = freezed,
    Object? firstname = freezed,
    Object? lastname = freezed,
    Object? avatar = freezed,
    Object? language = freezed,
    Object? theme = freezed,
    Object? accessLevel = freezed,
  }) {
    return _then(_value.copyWith(
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
              as Uri,
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
    ));
  }
}

/// @nodoc
abstract class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) then) = __$UserCopyWithImpl<$Res>;
  @override
  $Res call({String username, String firstname, String lastname, Uri avatar, Languages language, String theme, AccessLevels accessLevel});
}

/// @nodoc
class __$UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res> implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(_User _value, $Res Function(_User) _then) : super(_value, (v) => _then(v as _User));

  @override
  _User get _value => super._value as _User;

  @override
  $Res call({
    Object? username = freezed,
    Object? firstname = freezed,
    Object? lastname = freezed,
    Object? avatar = freezed,
    Object? language = freezed,
    Object? theme = freezed,
    Object? accessLevel = freezed,
  }) {
    return _then(_User(
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
              as Uri,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User implements _User {
  const _$_User({required this.username, required this.firstname, required this.lastname, required this.avatar, required this.language, required this.theme, required this.accessLevel});

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  final String username;
  @override
  final String firstname;
  @override
  final String lastname;
  @override
  final Uri avatar;
  @override
  final Languages language;
  @override
  final String theme;
  @override
  final AccessLevels accessLevel;

  @override
  String toString() {
    return 'User(username: $username, firstname: $firstname, lastname: $lastname, avatar: $avatar, language: $language, theme: $theme, accessLevel: $accessLevel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _User &&
            const DeepCollectionEquality().equals(other.username, username) &&
            const DeepCollectionEquality().equals(other.firstname, firstname) &&
            const DeepCollectionEquality().equals(other.lastname, lastname) &&
            const DeepCollectionEquality().equals(other.avatar, avatar) &&
            const DeepCollectionEquality().equals(other.language, language) &&
            const DeepCollectionEquality().equals(other.theme, theme) &&
            const DeepCollectionEquality().equals(other.accessLevel, accessLevel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(username), const DeepCollectionEquality().hash(firstname), const DeepCollectionEquality().hash(lastname), const DeepCollectionEquality().hash(avatar),
      const DeepCollectionEquality().hash(language), const DeepCollectionEquality().hash(theme), const DeepCollectionEquality().hash(accessLevel));

  @JsonKey(ignore: true)
  @override
  _$UserCopyWith<_User> get copyWith => __$UserCopyWithImpl<_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(this);
  }
}

abstract class _User implements User {
  const factory _User({required String username, required String firstname, required String lastname, required Uri avatar, required Languages language, required String theme, required AccessLevels accessLevel}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  String get username;
  @override
  String get firstname;
  @override
  String get lastname;
  @override
  Uri get avatar;
  @override
  Languages get language;
  @override
  String get theme;
  @override
  AccessLevels get accessLevel;
  @override
  @JsonKey(ignore: true)
  _$UserCopyWith<_User> get copyWith => throw _privateConstructorUsedError;
}
