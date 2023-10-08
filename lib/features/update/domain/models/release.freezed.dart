// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'release.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Release _$ReleaseFromJson(Map<String, dynamic> json) {
  return _Release.fromJson(json);
}

/// @nodoc
mixin _$Release {
  /// The build channel of the release.
  BuildChannel get channel => throw _privateConstructorUsedError;

  /// The version of the release as a string.
  ///
  /// To get the version as a [Version] object, use [version].
// ignore: invalid_annotation_target
  @JsonKey(name: "version")
  String get versionString => throw _privateConstructorUsedError;

  /// The download links for the release.
  ReleaseDownloads get downloads => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReleaseCopyWith<Release> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReleaseCopyWith<$Res> {
  factory $ReleaseCopyWith(Release value, $Res Function(Release) then) =
      _$ReleaseCopyWithImpl<$Res, Release>;
  @useResult
  $Res call(
      {BuildChannel channel,
      @JsonKey(name: "version") String versionString,
      ReleaseDownloads downloads});

  $ReleaseDownloadsCopyWith<$Res> get downloads;
}

/// @nodoc
class _$ReleaseCopyWithImpl<$Res, $Val extends Release>
    implements $ReleaseCopyWith<$Res> {
  _$ReleaseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channel = null,
    Object? versionString = null,
    Object? downloads = null,
  }) {
    return _then(_value.copyWith(
      channel: null == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as BuildChannel,
      versionString: null == versionString
          ? _value.versionString
          : versionString // ignore: cast_nullable_to_non_nullable
              as String,
      downloads: null == downloads
          ? _value.downloads
          : downloads // ignore: cast_nullable_to_non_nullable
              as ReleaseDownloads,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ReleaseDownloadsCopyWith<$Res> get downloads {
    return $ReleaseDownloadsCopyWith<$Res>(_value.downloads, (value) {
      return _then(_value.copyWith(downloads: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ReleaseCopyWith<$Res> implements $ReleaseCopyWith<$Res> {
  factory _$$_ReleaseCopyWith(
          _$_Release value, $Res Function(_$_Release) then) =
      __$$_ReleaseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BuildChannel channel,
      @JsonKey(name: "version") String versionString,
      ReleaseDownloads downloads});

  @override
  $ReleaseDownloadsCopyWith<$Res> get downloads;
}

/// @nodoc
class __$$_ReleaseCopyWithImpl<$Res>
    extends _$ReleaseCopyWithImpl<$Res, _$_Release>
    implements _$$_ReleaseCopyWith<$Res> {
  __$$_ReleaseCopyWithImpl(_$_Release _value, $Res Function(_$_Release) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channel = null,
    Object? versionString = null,
    Object? downloads = null,
  }) {
    return _then(_$_Release(
      channel: null == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as BuildChannel,
      versionString: null == versionString
          ? _value.versionString
          : versionString // ignore: cast_nullable_to_non_nullable
              as String,
      downloads: null == downloads
          ? _value.downloads
          : downloads // ignore: cast_nullable_to_non_nullable
              as ReleaseDownloads,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Release extends _Release {
  _$_Release(
      {required this.channel,
      @JsonKey(name: "version") required this.versionString,
      required this.downloads})
      : super._();

  factory _$_Release.fromJson(Map<String, dynamic> json) =>
      _$$_ReleaseFromJson(json);

  /// The build channel of the release.
  @override
  final BuildChannel channel;

  /// The version of the release as a string.
  ///
  /// To get the version as a [Version] object, use [version].
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: "version")
  final String versionString;

  /// The download links for the release.
  @override
  final ReleaseDownloads downloads;

  @override
  String toString() {
    return 'Release(channel: $channel, versionString: $versionString, downloads: $downloads)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Release &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.versionString, versionString) ||
                other.versionString == versionString) &&
            (identical(other.downloads, downloads) ||
                other.downloads == downloads));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, channel, versionString, downloads);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReleaseCopyWith<_$_Release> get copyWith =>
      __$$_ReleaseCopyWithImpl<_$_Release>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReleaseToJson(
      this,
    );
  }
}

abstract class _Release extends Release {
  factory _Release(
      {required final BuildChannel channel,
      @JsonKey(name: "version") required final String versionString,
      required final ReleaseDownloads downloads}) = _$_Release;
  _Release._() : super._();

  factory _Release.fromJson(Map<String, dynamic> json) = _$_Release.fromJson;

  @override

  /// The build channel of the release.
  BuildChannel get channel;
  @override

  /// The version of the release as a string.
  ///
  /// To get the version as a [Version] object, use [version].
// ignore: invalid_annotation_target
  @JsonKey(name: "version")
  String get versionString;
  @override

  /// The download links for the release.
  ReleaseDownloads get downloads;
  @override
  @JsonKey(ignore: true)
  _$$_ReleaseCopyWith<_$_Release> get copyWith =>
      throw _privateConstructorUsedError;
}
