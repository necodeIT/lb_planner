import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lb_planner/features/update/update.dart';
import 'package:lb_planner/shared/shared.dart';

part 'release.freezed.dart';
part 'release.g.dart';

/// Represents a release of the application.
@freezed
class Release with _$Release {
  Release._();

  /// Represents a release of the application.
  factory Release({
    /// The build channel of the release.
    required BuildChannel channel,

    /// The version of the release as a string.
    ///
    /// To get the version as a [Version] object, use [version].
    // ignore: invalid_annotation_target
    @JsonKey(name: "version") required String versionString,

    /// The download links for the release.
    required ReleaseDownloads downloads,

    /// The changelog for the release in markdown format.
    required String changelog,
  }) = _Release;

  /// The version of the release as a [Version] object.
  Version get version => Version.fromString(versionString);

  /// The name of the release.
  ///
  /// e.g.
  ///
  /// ```dart
  /// Release(versionString: "1.2.3+4", channel: BuildChannel.stable).name == "1.2.3+4-stable"
  /// ```
  String get name => "${version.version}-${channel.name}";

  /// Release from JSON.
  factory Release.fromJson(Map<String, dynamic> json) =>
      _$ReleaseFromJson(json);
}
