// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'version.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Version _$VersionFromJson(Map<String, dynamic> json) {
  return _Version.fromJson(json);
}

/// @nodoc
class _$VersionTearOff {
  const _$VersionTearOff();

  _Version call(
      {required int majorVersion,
      required int minorVersion,
      required int patchVersion}) {
    return _Version(
      majorVersion: majorVersion,
      minorVersion: minorVersion,
      patchVersion: patchVersion,
    );
  }

  Version fromJson(Map<String, Object?> json) {
    return Version.fromJson(json);
  }
}

/// @nodoc
const $Version = _$VersionTearOff();

/// @nodoc
mixin _$Version {
  /// Major version number
  int get majorVersion => throw _privateConstructorUsedError;

  /// Minor version number
  int get minorVersion => throw _privateConstructorUsedError;

  /// Patch version number
  int get patchVersion => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VersionCopyWith<Version> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VersionCopyWith<$Res> {
  factory $VersionCopyWith(Version value, $Res Function(Version) then) =
      _$VersionCopyWithImpl<$Res>;
  $Res call({int majorVersion, int minorVersion, int patchVersion});
}

/// @nodoc
class _$VersionCopyWithImpl<$Res> implements $VersionCopyWith<$Res> {
  _$VersionCopyWithImpl(this._value, this._then);

  final Version _value;
  // ignore: unused_field
  final $Res Function(Version) _then;

  @override
  $Res call({
    Object? majorVersion = freezed,
    Object? minorVersion = freezed,
    Object? patchVersion = freezed,
  }) {
    return _then(_value.copyWith(
      majorVersion: majorVersion == freezed
          ? _value.majorVersion
          : majorVersion // ignore: cast_nullable_to_non_nullable
              as int,
      minorVersion: minorVersion == freezed
          ? _value.minorVersion
          : minorVersion // ignore: cast_nullable_to_non_nullable
              as int,
      patchVersion: patchVersion == freezed
          ? _value.patchVersion
          : patchVersion // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$VersionCopyWith<$Res> implements $VersionCopyWith<$Res> {
  factory _$VersionCopyWith(_Version value, $Res Function(_Version) then) =
      __$VersionCopyWithImpl<$Res>;
  @override
  $Res call({int majorVersion, int minorVersion, int patchVersion});
}

/// @nodoc
class __$VersionCopyWithImpl<$Res> extends _$VersionCopyWithImpl<$Res>
    implements _$VersionCopyWith<$Res> {
  __$VersionCopyWithImpl(_Version _value, $Res Function(_Version) _then)
      : super(_value, (v) => _then(v as _Version));

  @override
  _Version get _value => super._value as _Version;

  @override
  $Res call({
    Object? majorVersion = freezed,
    Object? minorVersion = freezed,
    Object? patchVersion = freezed,
  }) {
    return _then(_Version(
      majorVersion: majorVersion == freezed
          ? _value.majorVersion
          : majorVersion // ignore: cast_nullable_to_non_nullable
              as int,
      minorVersion: minorVersion == freezed
          ? _value.minorVersion
          : minorVersion // ignore: cast_nullable_to_non_nullable
              as int,
      patchVersion: patchVersion == freezed
          ? _value.patchVersion
          : patchVersion // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Version extends _Version {
  const _$_Version(
      {required this.majorVersion,
      required this.minorVersion,
      required this.patchVersion})
      : super._();

  factory _$_Version.fromJson(Map<String, dynamic> json) =>
      _$$_VersionFromJson(json);

  @override

  /// Major version number
  final int majorVersion;
  @override

  /// Minor version number
  final int minorVersion;
  @override

  /// Patch version number
  final int patchVersion;

  @JsonKey(ignore: true)
  @override
  _$VersionCopyWith<_Version> get copyWith =>
      __$VersionCopyWithImpl<_Version>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VersionToJson(this);
  }
}

abstract class _Version extends Version {
  const factory _Version(
      {required int majorVersion,
      required int minorVersion,
      required int patchVersion}) = _$_Version;
  const _Version._() : super._();

  factory _Version.fromJson(Map<String, dynamic> json) = _$_Version.fromJson;

  @override

  /// Major version number
  int get majorVersion;
  @override

  /// Minor version number
  int get minorVersion;
  @override

  /// Patch version number
  int get patchVersion;
  @override
  @JsonKey(ignore: true)
  _$VersionCopyWith<_Version> get copyWith =>
      throw _privateConstructorUsedError;
}
