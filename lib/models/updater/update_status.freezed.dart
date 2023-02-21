// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'update_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UpdateStatusTearOff {
  const _$UpdateStatusTearOff();

  _UpdateStatus call(
      {bool updateAvailable = false,
      String latestVersionName = "",
      String fileName = "",
      DownloadStatus downloadStatus = DownloadStatus.idle,
      int progress = 0,
      String error = "",
      String patchNotes = "",
      String command = ""}) {
    return _UpdateStatus(
      updateAvailable: updateAvailable,
      latestVersionName: latestVersionName,
      fileName: fileName,
      downloadStatus: downloadStatus,
      progress: progress,
      error: error,
      patchNotes: patchNotes,
      command: command,
    );
  }
}

/// @nodoc
const $UpdateStatus = _$UpdateStatusTearOff();

/// @nodoc
mixin _$UpdateStatus {
  /// If true, an update is available.
  bool get updateAvailable => throw _privateConstructorUsedError;

  /// The version name of the latest update.
  String get latestVersionName => throw _privateConstructorUsedError;

  /// The name of the file being downloaded if [autoInstall] is true.
  String get fileName => throw _privateConstructorUsedError;

  /// The download and installation status of an update.
  DownloadStatus get downloadStatus => throw _privateConstructorUsedError;

  /// The progress of the download in percent (0-100) if [downloadStatus] is [DownloadStatus.downloading].
  int get progress => throw _privateConstructorUsedError;

  /// The error message if [downloadStatus] is [DownloadStatus.error].
  String get error => throw _privateConstructorUsedError;

  /// The patch notes of the latest update.
  String get patchNotes => throw _privateConstructorUsedError;

  /// Command the user has to run if [autoInstall] is false.
  String get command => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UpdateStatusCopyWith<UpdateStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateStatusCopyWith<$Res> {
  factory $UpdateStatusCopyWith(
          UpdateStatus value, $Res Function(UpdateStatus) then) =
      _$UpdateStatusCopyWithImpl<$Res>;
  $Res call(
      {bool updateAvailable,
      String latestVersionName,
      String fileName,
      DownloadStatus downloadStatus,
      int progress,
      String error,
      String patchNotes,
      String command});
}

/// @nodoc
class _$UpdateStatusCopyWithImpl<$Res> implements $UpdateStatusCopyWith<$Res> {
  _$UpdateStatusCopyWithImpl(this._value, this._then);

  final UpdateStatus _value;
  // ignore: unused_field
  final $Res Function(UpdateStatus) _then;

  @override
  $Res call({
    Object? updateAvailable = freezed,
    Object? latestVersionName = freezed,
    Object? fileName = freezed,
    Object? downloadStatus = freezed,
    Object? progress = freezed,
    Object? error = freezed,
    Object? patchNotes = freezed,
    Object? command = freezed,
  }) {
    return _then(_value.copyWith(
      updateAvailable: updateAvailable == freezed
          ? _value.updateAvailable
          : updateAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      latestVersionName: latestVersionName == freezed
          ? _value.latestVersionName
          : latestVersionName // ignore: cast_nullable_to_non_nullable
              as String,
      fileName: fileName == freezed
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      downloadStatus: downloadStatus == freezed
          ? _value.downloadStatus
          : downloadStatus // ignore: cast_nullable_to_non_nullable
              as DownloadStatus,
      progress: progress == freezed
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as int,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      patchNotes: patchNotes == freezed
          ? _value.patchNotes
          : patchNotes // ignore: cast_nullable_to_non_nullable
              as String,
      command: command == freezed
          ? _value.command
          : command // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$UpdateStatusCopyWith<$Res>
    implements $UpdateStatusCopyWith<$Res> {
  factory _$UpdateStatusCopyWith(
          _UpdateStatus value, $Res Function(_UpdateStatus) then) =
      __$UpdateStatusCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool updateAvailable,
      String latestVersionName,
      String fileName,
      DownloadStatus downloadStatus,
      int progress,
      String error,
      String patchNotes,
      String command});
}

/// @nodoc
class __$UpdateStatusCopyWithImpl<$Res> extends _$UpdateStatusCopyWithImpl<$Res>
    implements _$UpdateStatusCopyWith<$Res> {
  __$UpdateStatusCopyWithImpl(
      _UpdateStatus _value, $Res Function(_UpdateStatus) _then)
      : super(_value, (v) => _then(v as _UpdateStatus));

  @override
  _UpdateStatus get _value => super._value as _UpdateStatus;

  @override
  $Res call({
    Object? updateAvailable = freezed,
    Object? latestVersionName = freezed,
    Object? fileName = freezed,
    Object? downloadStatus = freezed,
    Object? progress = freezed,
    Object? error = freezed,
    Object? patchNotes = freezed,
    Object? command = freezed,
  }) {
    return _then(_UpdateStatus(
      updateAvailable: updateAvailable == freezed
          ? _value.updateAvailable
          : updateAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      latestVersionName: latestVersionName == freezed
          ? _value.latestVersionName
          : latestVersionName // ignore: cast_nullable_to_non_nullable
              as String,
      fileName: fileName == freezed
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      downloadStatus: downloadStatus == freezed
          ? _value.downloadStatus
          : downloadStatus // ignore: cast_nullable_to_non_nullable
              as DownloadStatus,
      progress: progress == freezed
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as int,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      patchNotes: patchNotes == freezed
          ? _value.patchNotes
          : patchNotes // ignore: cast_nullable_to_non_nullable
              as String,
      command: command == freezed
          ? _value.command
          : command // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UpdateStatus implements _UpdateStatus {
  _$_UpdateStatus(
      {this.updateAvailable = false,
      this.latestVersionName = "",
      this.fileName = "",
      this.downloadStatus = DownloadStatus.idle,
      this.progress = 0,
      this.error = "",
      this.patchNotes = "",
      this.command = ""});

  @JsonKey()
  @override

  /// If true, an update is available.
  final bool updateAvailable;
  @JsonKey()
  @override

  /// The version name of the latest update.
  final String latestVersionName;
  @JsonKey()
  @override

  /// The name of the file being downloaded if [autoInstall] is true.
  final String fileName;
  @JsonKey()
  @override

  /// The download and installation status of an update.
  final DownloadStatus downloadStatus;
  @JsonKey()
  @override

  /// The progress of the download in percent (0-100) if [downloadStatus] is [DownloadStatus.downloading].
  final int progress;
  @JsonKey()
  @override

  /// The error message if [downloadStatus] is [DownloadStatus.error].
  final String error;
  @JsonKey()
  @override

  /// The patch notes of the latest update.
  final String patchNotes;
  @JsonKey()
  @override

  /// Command the user has to run if [autoInstall] is false.
  final String command;

  @override
  String toString() {
    return 'UpdateStatus(updateAvailable: $updateAvailable, latestVersionName: $latestVersionName, fileName: $fileName, downloadStatus: $downloadStatus, progress: $progress, error: $error, patchNotes: $patchNotes, command: $command)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateStatus &&
            const DeepCollectionEquality()
                .equals(other.updateAvailable, updateAvailable) &&
            const DeepCollectionEquality()
                .equals(other.latestVersionName, latestVersionName) &&
            const DeepCollectionEquality().equals(other.fileName, fileName) &&
            const DeepCollectionEquality()
                .equals(other.downloadStatus, downloadStatus) &&
            const DeepCollectionEquality().equals(other.progress, progress) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality()
                .equals(other.patchNotes, patchNotes) &&
            const DeepCollectionEquality().equals(other.command, command));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(updateAvailable),
      const DeepCollectionEquality().hash(latestVersionName),
      const DeepCollectionEquality().hash(fileName),
      const DeepCollectionEquality().hash(downloadStatus),
      const DeepCollectionEquality().hash(progress),
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(patchNotes),
      const DeepCollectionEquality().hash(command));

  @JsonKey(ignore: true)
  @override
  _$UpdateStatusCopyWith<_UpdateStatus> get copyWith =>
      __$UpdateStatusCopyWithImpl<_UpdateStatus>(this, _$identity);
}

abstract class _UpdateStatus implements UpdateStatus {
  factory _UpdateStatus(
      {bool updateAvailable,
      String latestVersionName,
      String fileName,
      DownloadStatus downloadStatus,
      int progress,
      String error,
      String patchNotes,
      String command}) = _$_UpdateStatus;

  @override

  /// If true, an update is available.
  bool get updateAvailable;
  @override

  /// The version name of the latest update.
  String get latestVersionName;
  @override

  /// The name of the file being downloaded if [autoInstall] is true.
  String get fileName;
  @override

  /// The download and installation status of an update.
  DownloadStatus get downloadStatus;
  @override

  /// The progress of the download in percent (0-100) if [downloadStatus] is [DownloadStatus.downloading].
  int get progress;
  @override

  /// The error message if [downloadStatus] is [DownloadStatus.error].
  String get error;
  @override

  /// The patch notes of the latest update.
  String get patchNotes;
  @override

  /// Command the user has to run if [autoInstall] is false.
  String get command;
  @override
  @JsonKey(ignore: true)
  _$UpdateStatusCopyWith<_UpdateStatus> get copyWith =>
      throw _privateConstructorUsedError;
}
