// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'version.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Version _$VersionFromJson(Map<String, dynamic> json) {
  return _Version.fromJson(json);
}

/// @nodoc
mixin _$Version {
  /// The major version number.
  int get major => throw _privateConstructorUsedError;

  /// The minor version number.
  int get minor => throw _privateConstructorUsedError;

  /// The patch version number.
  int get patch => throw _privateConstructorUsedError;

  /// The build number.
  int get build => throw _privateConstructorUsedError;

  /// The build channel.
  BuildChannel get channel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VersionCopyWith<Version> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VersionCopyWith<$Res> {
  factory $VersionCopyWith(Version value, $Res Function(Version) then) =
      _$VersionCopyWithImpl<$Res, Version>;
  @useResult
  $Res call({int major, int minor, int patch, int build, BuildChannel channel});
}

/// @nodoc
class _$VersionCopyWithImpl<$Res, $Val extends Version>
    implements $VersionCopyWith<$Res> {
  _$VersionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? major = null,
    Object? minor = null,
    Object? patch = null,
    Object? build = null,
    Object? channel = null,
  }) {
    return _then(_value.copyWith(
      major: null == major
          ? _value.major
          : major // ignore: cast_nullable_to_non_nullable
              as int,
      minor: null == minor
          ? _value.minor
          : minor // ignore: cast_nullable_to_non_nullable
              as int,
      patch: null == patch
          ? _value.patch
          : patch // ignore: cast_nullable_to_non_nullable
              as int,
      build: null == build
          ? _value.build
          : build // ignore: cast_nullable_to_non_nullable
              as int,
      channel: null == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as BuildChannel,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_VersionCopyWith<$Res> implements $VersionCopyWith<$Res> {
  factory _$$_VersionCopyWith(
          _$_Version value, $Res Function(_$_Version) then) =
      __$$_VersionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int major, int minor, int patch, int build, BuildChannel channel});
}

/// @nodoc
class __$$_VersionCopyWithImpl<$Res>
    extends _$VersionCopyWithImpl<$Res, _$_Version>
    implements _$$_VersionCopyWith<$Res> {
  __$$_VersionCopyWithImpl(_$_Version _value, $Res Function(_$_Version) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? major = null,
    Object? minor = null,
    Object? patch = null,
    Object? build = null,
    Object? channel = null,
  }) {
    return _then(_$_Version(
      major: null == major
          ? _value.major
          : major // ignore: cast_nullable_to_non_nullable
              as int,
      minor: null == minor
          ? _value.minor
          : minor // ignore: cast_nullable_to_non_nullable
              as int,
      patch: null == patch
          ? _value.patch
          : patch // ignore: cast_nullable_to_non_nullable
              as int,
      build: null == build
          ? _value.build
          : build // ignore: cast_nullable_to_non_nullable
              as int,
      channel: null == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as BuildChannel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Version extends _Version {
  _$_Version(
      {required this.major,
      required this.minor,
      required this.patch,
      this.build = 0,
      this.channel = BuildChannel.stable})
      : super._();

  factory _$_Version.fromJson(Map<String, dynamic> json) =>
      _$$_VersionFromJson(json);

  /// The major version number.
  @override
  final int major;

  /// The minor version number.
  @override
  final int minor;

  /// The patch version number.
  @override
  final int patch;

  /// The build number.
  @override
  @JsonKey()
  final int build;

  /// The build channel.
  @override
  @JsonKey()
  final BuildChannel channel;

  @override
  String toString() {
    return 'Version(major: $major, minor: $minor, patch: $patch, build: $build, channel: $channel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Version &&
            (identical(other.major, major) || other.major == major) &&
            (identical(other.minor, minor) || other.minor == minor) &&
            (identical(other.patch, patch) || other.patch == patch) &&
            (identical(other.build, build) || other.build == build) &&
            (identical(other.channel, channel) || other.channel == channel));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, major, minor, patch, build, channel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VersionCopyWith<_$_Version> get copyWith =>
      __$$_VersionCopyWithImpl<_$_Version>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VersionToJson(
      this,
    );
  }
}

abstract class _Version extends Version {
  factory _Version(
      {required final int major,
      required final int minor,
      required final int patch,
      final int build,
      final BuildChannel channel}) = _$_Version;
  _Version._() : super._();

  factory _Version.fromJson(Map<String, dynamic> json) = _$_Version.fromJson;

  @override

  /// The major version number.
  int get major;
  @override

  /// The minor version number.
  int get minor;
  @override

  /// The patch version number.
  int get patch;
  @override

  /// The build number.
  int get build;
  @override

  /// The build channel.
  BuildChannel get channel;
  @override
  @JsonKey(ignore: true)
  _$$_VersionCopyWith<_$_Version> get copyWith =>
      throw _privateConstructorUsedError;
}
