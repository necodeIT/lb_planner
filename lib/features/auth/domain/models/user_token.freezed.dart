// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserToken _$UserTokenFromJson(Map<String, dynamic> json) {
  return _UserToken.fromJson(json);
}

/// @nodoc
mixin _$UserToken {
  /// The token for the moodle_mobile_app web service
  ///
  /// This is used when utilizing the Moodle Mobile App web service
  String get moodleMobileAppToken => throw _privateConstructorUsedError;

  /// The token for the lbpa (LB Planner API) web service
  ///
  /// This is used when utilizing the LB Planner API
  String get lbPlannerApiToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserTokenCopyWith<UserToken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserTokenCopyWith<$Res> {
  factory $UserTokenCopyWith(UserToken value, $Res Function(UserToken) then) =
      _$UserTokenCopyWithImpl<$Res, UserToken>;
  @useResult
  $Res call({String moodleMobileAppToken, String lbPlannerApiToken});
}

/// @nodoc
class _$UserTokenCopyWithImpl<$Res, $Val extends UserToken>
    implements $UserTokenCopyWith<$Res> {
  _$UserTokenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? moodleMobileAppToken = null,
    Object? lbPlannerApiToken = null,
  }) {
    return _then(_value.copyWith(
      moodleMobileAppToken: null == moodleMobileAppToken
          ? _value.moodleMobileAppToken
          : moodleMobileAppToken // ignore: cast_nullable_to_non_nullable
              as String,
      lbPlannerApiToken: null == lbPlannerApiToken
          ? _value.lbPlannerApiToken
          : lbPlannerApiToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserTokenCopyWith<$Res> implements $UserTokenCopyWith<$Res> {
  factory _$$_UserTokenCopyWith(
          _$_UserToken value, $Res Function(_$_UserToken) then) =
      __$$_UserTokenCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String moodleMobileAppToken, String lbPlannerApiToken});
}

/// @nodoc
class __$$_UserTokenCopyWithImpl<$Res>
    extends _$UserTokenCopyWithImpl<$Res, _$_UserToken>
    implements _$$_UserTokenCopyWith<$Res> {
  __$$_UserTokenCopyWithImpl(
      _$_UserToken _value, $Res Function(_$_UserToken) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? moodleMobileAppToken = null,
    Object? lbPlannerApiToken = null,
  }) {
    return _then(_$_UserToken(
      moodleMobileAppToken: null == moodleMobileAppToken
          ? _value.moodleMobileAppToken
          : moodleMobileAppToken // ignore: cast_nullable_to_non_nullable
              as String,
      lbPlannerApiToken: null == lbPlannerApiToken
          ? _value.lbPlannerApiToken
          : lbPlannerApiToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserToken implements _UserToken {
  _$_UserToken(
      {required this.moodleMobileAppToken, required this.lbPlannerApiToken});

  factory _$_UserToken.fromJson(Map<String, dynamic> json) =>
      _$$_UserTokenFromJson(json);

  /// The token for the moodle_mobile_app web service
  ///
  /// This is used when utilizing the Moodle Mobile App web service
  @override
  final String moodleMobileAppToken;

  /// The token for the lbpa (LB Planner API) web service
  ///
  /// This is used when utilizing the LB Planner API
  @override
  final String lbPlannerApiToken;

  @override
  String toString() {
    return 'UserToken(moodleMobileAppToken: $moodleMobileAppToken, lbPlannerApiToken: $lbPlannerApiToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserToken &&
            (identical(other.moodleMobileAppToken, moodleMobileAppToken) ||
                other.moodleMobileAppToken == moodleMobileAppToken) &&
            (identical(other.lbPlannerApiToken, lbPlannerApiToken) ||
                other.lbPlannerApiToken == lbPlannerApiToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, moodleMobileAppToken, lbPlannerApiToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserTokenCopyWith<_$_UserToken> get copyWith =>
      __$$_UserTokenCopyWithImpl<_$_UserToken>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserTokenToJson(
      this,
    );
  }
}

abstract class _UserToken implements UserToken {
  factory _UserToken(
      {required final String moodleMobileAppToken,
      required final String lbPlannerApiToken}) = _$_UserToken;

  factory _UserToken.fromJson(Map<String, dynamic> json) =
      _$_UserToken.fromJson;

  @override

  /// The token for the moodle_mobile_app web service
  ///
  /// This is used when utilizing the Moodle Mobile App web service
  String get moodleMobileAppToken;
  @override

  /// The token for the lbpa (LB Planner API) web service
  ///
  /// This is used when utilizing the LB Planner API
  String get lbPlannerApiToken;
  @override
  @JsonKey(ignore: true)
  _$$_UserTokenCopyWith<_$_UserToken> get copyWith =>
      throw _privateConstructorUsedError;
}
