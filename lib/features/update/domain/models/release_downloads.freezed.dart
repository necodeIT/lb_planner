// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'release_downloads.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReleaseDownloads _$ReleaseDownloadsFromJson(Map<String, dynamic> json) {
  return _ReleaseDownloads.fromJson(json);
}

/// @nodoc
mixin _$ReleaseDownloads {
  /// The download link for the Windows version of the release.
  String get windows => throw _privateConstructorUsedError;

  /// The download link for the macOS version of the release.
// ignore: invalid_annotation_target
  @JsonKey(name: "mac")
  String get macos => throw _privateConstructorUsedError;

  /// The download link for the Linux version of the release.
  String get linux => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReleaseDownloadsCopyWith<ReleaseDownloads> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReleaseDownloadsCopyWith<$Res> {
  factory $ReleaseDownloadsCopyWith(
          ReleaseDownloads value, $Res Function(ReleaseDownloads) then) =
      _$ReleaseDownloadsCopyWithImpl<$Res, ReleaseDownloads>;
  @useResult
  $Res call({String windows, @JsonKey(name: "mac") String macos, String linux});
}

/// @nodoc
class _$ReleaseDownloadsCopyWithImpl<$Res, $Val extends ReleaseDownloads>
    implements $ReleaseDownloadsCopyWith<$Res> {
  _$ReleaseDownloadsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? windows = null,
    Object? macos = null,
    Object? linux = null,
  }) {
    return _then(_value.copyWith(
      windows: null == windows
          ? _value.windows
          : windows // ignore: cast_nullable_to_non_nullable
              as String,
      macos: null == macos
          ? _value.macos
          : macos // ignore: cast_nullable_to_non_nullable
              as String,
      linux: null == linux
          ? _value.linux
          : linux // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReleaseDownloadsCopyWith<$Res>
    implements $ReleaseDownloadsCopyWith<$Res> {
  factory _$$_ReleaseDownloadsCopyWith(
          _$_ReleaseDownloads value, $Res Function(_$_ReleaseDownloads) then) =
      __$$_ReleaseDownloadsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String windows, @JsonKey(name: "mac") String macos, String linux});
}

/// @nodoc
class __$$_ReleaseDownloadsCopyWithImpl<$Res>
    extends _$ReleaseDownloadsCopyWithImpl<$Res, _$_ReleaseDownloads>
    implements _$$_ReleaseDownloadsCopyWith<$Res> {
  __$$_ReleaseDownloadsCopyWithImpl(
      _$_ReleaseDownloads _value, $Res Function(_$_ReleaseDownloads) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? windows = null,
    Object? macos = null,
    Object? linux = null,
  }) {
    return _then(_$_ReleaseDownloads(
      windows: null == windows
          ? _value.windows
          : windows // ignore: cast_nullable_to_non_nullable
              as String,
      macos: null == macos
          ? _value.macos
          : macos // ignore: cast_nullable_to_non_nullable
              as String,
      linux: null == linux
          ? _value.linux
          : linux // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReleaseDownloads implements _ReleaseDownloads {
  _$_ReleaseDownloads(
      {required this.windows,
      @JsonKey(name: "mac") required this.macos,
      required this.linux});

  factory _$_ReleaseDownloads.fromJson(Map<String, dynamic> json) =>
      _$$_ReleaseDownloadsFromJson(json);

  /// The download link for the Windows version of the release.
  @override
  final String windows;

  /// The download link for the macOS version of the release.
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: "mac")
  final String macos;

  /// The download link for the Linux version of the release.
  @override
  final String linux;

  @override
  String toString() {
    return 'ReleaseDownloads(windows: $windows, macos: $macos, linux: $linux)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReleaseDownloads &&
            (identical(other.windows, windows) || other.windows == windows) &&
            (identical(other.macos, macos) || other.macos == macos) &&
            (identical(other.linux, linux) || other.linux == linux));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, windows, macos, linux);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReleaseDownloadsCopyWith<_$_ReleaseDownloads> get copyWith =>
      __$$_ReleaseDownloadsCopyWithImpl<_$_ReleaseDownloads>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReleaseDownloadsToJson(
      this,
    );
  }
}

abstract class _ReleaseDownloads implements ReleaseDownloads {
  factory _ReleaseDownloads(
      {required final String windows,
      @JsonKey(name: "mac") required final String macos,
      required final String linux}) = _$_ReleaseDownloads;

  factory _ReleaseDownloads.fromJson(Map<String, dynamic> json) =
      _$_ReleaseDownloads.fromJson;

  @override

  /// The download link for the Windows version of the release.
  String get windows;
  @override

  /// The download link for the macOS version of the release.
// ignore: invalid_annotation_target
  @JsonKey(name: "mac")
  String get macos;
  @override

  /// The download link for the Linux version of the release.
  String get linux;
  @override
  @JsonKey(ignore: true)
  _$$_ReleaseDownloadsCopyWith<_$_ReleaseDownloads> get copyWith =>
      throw _privateConstructorUsedError;
}
