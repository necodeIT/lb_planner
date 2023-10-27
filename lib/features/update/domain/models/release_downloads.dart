import 'package:freezed_annotation/freezed_annotation.dart';

part 'release_downloads.freezed.dart';
part 'release_downloads.g.dart';

/// Contains the download links for a release.
@freezed
class ReleaseDownloads with _$ReleaseDownloads {
  /// Contains the download links for a release.
  factory ReleaseDownloads({
    /// The download link for the Windows version of the release.
    required String windows,

    /// The download link for the macOS version of the release.
    // ignore: invalid_annotation_target
    @JsonKey(name: "mac") required String macos,

    /// The download link for the Linux version of the release.
    required String linux,
  }) = _ReleaseDownloads;

  /// ReleaseDownloads from JSON.
  factory ReleaseDownloads.fromJson(Map<String, dynamic> json) =>
      _$ReleaseDownloadsFromJson(json);
}
