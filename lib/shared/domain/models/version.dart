import 'package:freezed_annotation/freezed_annotation.dart';

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
  }) = _Version;

  /// The version number as a string.
  ///
  /// e.g. `1.2.3+4`
  String get version => "$major.$minor.$patch${build == 0 ? '' : '+$build'}";

  /// Version from JSON.
  factory Version.fromJson(Map<String, dynamic> json) =>
      _$VersionFromJson(json);

  /// Version from string.
  ///
  /// e.g.
  ///
  /// ```dart
  /// Version.fromString("1.2.3+4") == Version(major: 1, minor: 2, patch: 3, build: 4)
  /// ```
  factory Version.fromString(String string) {
    var versionString = string;

    // If the version string does not contain a build number, add a 0.
    if (!string.contains("+")) {
      // e.g. 1.2.3 -> 1.2.3+0
      versionString += "+0";
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

    var build = int.parse(version[1]);

    return Version(
      major: major,
      minor: minor,
      patch: patch,
      build: build,
    );
  }

  /// Returns `true` if this version is greater than [other].
  bool operator >(Version other) {
    if (this == other) {
      return false;
    }

    if (major > other.major) {
      return true;
    } else if (major < other.major) {
      return false;
    }

    if (minor > other.minor) {
      return true;
    } else if (minor < other.minor) {
      return false;
    }

    if (patch > other.patch) {
      return true;
    } else if (patch < other.patch) {
      return false;
    }

    if (build > other.build) {
      return true;
    }

    return false;
  }

  /// Returns `true` if this version is less than [other].
  bool operator <(Version other) => !(this > other) && this != other;
}

/// Enum representing the different build channels the app can be in.
enum BuildChannel {
  /// Development channel, usually the most up-to-date but least stable.
  dev,

  ///  Beta channel, more stable than `dev` but may still have issues.
  beta,

  /// Stable channel, the most stable version available for users.
  stable,
}
