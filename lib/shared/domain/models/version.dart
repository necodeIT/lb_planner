import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lb_planner/configs/version.dart';

part 'version.freezed.dart';
part 'version.g.dart';

/// A data class representing a version.
@freezed
class Version with _$Version {
  Version._();

  /// A data class representing a version.
  factory Version({
    /// The major version number.
    required int major,

    /// The minor version number.
    required int minor,

    /// The patch version number.
    required int patch,

    /// The build number.
    @Default(0) int build,

    /// The build channel.
    @Default(BuildChannel.stable) BuildChannel channel,
  }) = _Version;

  /// The version number as a string.
  String get version => "$major.$minor.$patch";

  /// The version number as a string, including the build number.
  ///
  /// e.g.
  ///
  /// ```dart
  /// Version(major: 1, minor: 2, patch: 3, build: 4, channel: BuildChannel.stable).versionName == "1.2.3+4-stable"
  /// ```
  ///
  /// if the build number is 0, it is omitted.
  ///
  /// ```dart
  /// Version(major: 1, minor: 2, patch: 3, build: 0, channel: BuildChannel.stable).versionName == "1.2.3-stable"
  /// ```
  String get versionName =>
      "$version${build == 0 ? '' : '+$build'}${channel.name}";

  /// Version from JSON.
  factory Version.fromJson(Map<String, dynamic> json) =>
      _$VersionFromJson(json);

  /// Version from string.
  ///
  /// e.g.
  ///
  /// ```dart
  /// Version.fromString("1.2.3+4-stable") == Version(major: 1, minor: 2, patch: 3, build: 4, channel: BuildChannel.stable)
  /// ```
  factory Version.fromString(String string) {
    var versionString = string;

    // If the version string does not contain a build number, add a 0.
    if (!string.contains("+")) {
      // e.g. 1.2.3-stable -> 1.2.3+0-stable
      versionString = versionString.replaceAll("-", "+0-");
    }

    final version = versionString.split("+");

    if (version.length < 2) {
      throw FormatException("Invalid version string: $string");
    }

    final versionNumbers = version[0].split(".");

    if (versionNumbers.length != 3) {
      throw FormatException("Invalid version string: $string");
    }

    var major = int.parse(versionNumbers[0]);
    var minor = int.parse(versionNumbers[1]);
    var patch = int.parse(versionNumbers[2]);

    final buildAndChannel = version[1].split("-");

    if (buildAndChannel.length < 2) {
      throw FormatException("Invalid version string: $string");
    }

    var build = int.parse(buildAndChannel[0]);
    var channel = BuildChannel.values.byName(buildAndChannel[1]);

    return Version(
      major: major,
      minor: minor,
      patch: patch,
      build: build,
      channel: channel,
    );
  }
}
