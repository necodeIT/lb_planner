import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lbplanner_engine/lbplanner_engine.dart';

part 'update_status.freezed.dart';

@freezed

/// Contains information about the latest update and the download and installation status.
class UpdateStatus with _$UpdateStatus {
  /// Contains information about the latest update and the download and installation status.
  factory UpdateStatus({
    /// If true, an update is available.
    @Default(false) bool updateAvailable,

    /// The version name of the latest update.
    @Default("") String latestVersionName,

    /// The name of the file being downloaded if [autoInstall] is true.
    @Default("") String fileName,

    /// The download and installation status of an update.
    @Default(DownloadStatus.idle) DownloadStatus downloadStatus,

    /// The progress of the download in percent (0-100) if [downloadStatus] is [DownloadStatus.downloading].
    @Default(0) int progress,

    /// If false, the user has to manually download and install the update.
    @Default(true) bool autoInstall,

    /// The error message if [downloadStatus] is [DownloadStatus.error].
    @Default("") String error,

    /// The patch notes of the latest update.
    @Default("") String patchNotes,

    /// Command the user has to run if [autoInstall] is false.
    @Default("") String command,
  }) = _UpdateStatus;
}
