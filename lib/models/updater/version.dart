// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'version.freezed.dart';
part 'version.g.dart';

/// Represents a version number in the format x.y.z
///
/// x: Major version number
///
/// y: Minor version number
///
/// z: Patch version number
@freezed
class Version with _$Version {
  const Version._();

  /// Represents a version number in the format x.y.z
  ///
  /// x: Major version number
  ///
  /// y: Minor version number
  ///
  /// z: Patch version number
  const factory Version({
    /// Major version number
    required int majorVersion,

    /// Minor version number
    required int minorVersion,

    /// Patch version number
    required int patchVersion,
  }) = _Version;

  /// Version from String
  ///
  /// Parses a version string in the format x.y.z
  ///
  /// x: Major version number
  ///
  /// y: Minor version number
  ///
  /// z: Patch version number
  ///
  /// Throws [ArgumentError] if the version string is invalid
  factory Version.fromString(String version) => _VersionFromString(version);

  /// Version from json
  factory Version.fromJson(Map<String, dynamic> json) => _$VersionFromJson(json);

  @override
  String toString() => "$majorVersion.$minorVersion.$patchVersion";

  /// Checks if [this] version is lower than or equal to [other] version.
  bool operator <=(Version other) => majorVersion <= other.majorVersion && minorVersion <= other.minorVersion && patchVersion <= other.patchVersion;

  /// Checks if [this] version is higher than or equal to [other] version.
  bool operator >=(Version other) => majorVersion >= other.majorVersion && minorVersion >= other.minorVersion && patchVersion >= other.patchVersion;

  /// Checks if [this] version is lower than [other] version.
  bool operator <(Version other) => majorVersion < other.majorVersion && minorVersion < other.minorVersion && patchVersion < other.patchVersion;

  /// Checks if [this] version is higher than [other] version.
  bool operator >(Version other) => majorVersion > other.majorVersion && minorVersion > other.minorVersion && patchVersion > other.patchVersion;

  @override
  operator ==(other) {
    if (other is! Version) return false;

    return majorVersion == other.majorVersion && minorVersion == other.minorVersion && patchVersion == other.patchVersion;
  }

  @override
  // TODO: implement hashCode
  int get hashCode => super.hashCode;
}

Version _VersionFromString(String version) {
  if (!version.contains(RegExp(r"^[0-9.]+$"))) throw ArgumentError.value(version, "Invalid version number");

  var regex = RegExp(r"([0-9]*).([0-9]*).([0-9]*)");

  var result = regex.firstMatch(version);

  if (result == null) throw ArgumentError.value(version, "Invalid version number");

  return Version(
    majorVersion: int.parse(result.group(1)!),
    minorVersion: int.parse(result.group(2)!),
    patchVersion: int.parse(result.group(3)!),
  );
}
