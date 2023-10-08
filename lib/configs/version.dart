/// This library contains configurations related to the version and build channel of the app.
library configs.version;

import 'package:lb_planner/shared/shared.dart';

/// Holds the name of the application.
/// The value is read from the compile-time variable `APP_NAME`.
///
/// Defaults to `LB Planner` if the compile-time variable is not set.
///
/// In order to set the variable use `--dart-define` when building the app:
///
/// ```bash
/// flutter build [os] --dart-define=APP_NAME=`VALUE`
/// ```
const kAppName = String.fromEnvironment("APP_NAME", defaultValue: "LB Planner");

/// Holds the name of the application version.
/// The value is read from the compile-time variable `APP_VERSION_NAME`.
///
/// Defaults to `Debug ver.` if the compile-time variable is not set.
///
/// In order to set the variable use `--dart-define` when building the app:
///
/// ```bash
/// flutter build [os] --dart-define=APP_VERSION_NAME=`VALUE`
/// ```
const kAppVersionName =
    String.fromEnvironment("APP_VERSION_NAME", defaultValue: "Debug ver.");

/// Holds the major version of the application.
/// The value is read from the compile-time variable `MAJOR_APP_VERSION`.
///
/// Defaults to `0` if the compile-time variable is not set.
///
/// In order to set the variable use `--dart-define` when building the app:
///
/// ```bash
/// flutter build [os] --dart-define=MAJOR_APP_VERSION=`VALUE`
/// ```
const kMajorAppVersion =
    int.fromEnvironment("MAJOR_APP_VERSION", defaultValue: 0);

/// Holds the minor version of the application.
/// The value is read from the compile-time variable `MINOR_APP_VERSION`.
///
/// Defaults to `0` if the compile-time variable is not set.
///
/// In order to set the variable use `--dart-define` when building the app:
///
/// ```bash
/// flutter build [os] --dart-define=MINOR_APP_VERSION=`VALUE`
/// ```
const kMinorAppVersion =
    int.fromEnvironment("MINOR_APP_VERSION", defaultValue: 0);

/// Holds the patch version of the application.
/// The value is read from the compile-time variable `PATCH_APP_VERSION`.
///
/// Defaults to `0` if the compile-time variable is not set.
///
/// In order to set the variable use `--dart-define` when building the app:
///
/// ```bash
/// flutter build [os] --dart-define=PATCH_APP_VERSION=`VALUE`
/// ```
const kPatchAppVersion =
    int.fromEnvironment("PATCH_APP_VERSION", defaultValue: 0);

/// Holds the build number of the application.
/// The value is read from the compile-time variable `BUILD_NUMBER`.
///
/// In [BuildChannel.dev] or [BuildChannel.beta], the version usually stays the same until a stable release.
/// The build number helps us and the users differentiate between different builds of the same version.
///
/// The value is read from the compile-time variable `BUILD_NUMBER`.
///
/// Defaults to `0` if the compile-time variable is not set.
///
/// In order to set the variable use `--dart-define` when building the app:
///
/// ```bash
/// flutter build [os] --dart-define=BUILD_NUMBER=`VALUE`
/// ```
const kBuildNumber = int.fromEnvironment("BUILD_NUMBER", defaultValue: 0);

/// Build Channel
///
/// Holds the current build channel of the application.
/// The value is read from the compile-time variable `BUILD_CHANNEL`.
///
/// Defaults to [BuildChannel.dev] if the compile-time variable is not set.
///
/// In order to set the variable use `--dart-define` when building the app:
///
/// ```bash
/// flutter build [os] --dart-define=BUILD_CHANNEL=`VALUE`
/// ```
final kBuildChannel = BuildChannel.values.byName(_kBuildChannel);

const _kBuildChannel =
    String.fromEnvironment("BUILD_CHANNEL", defaultValue: "dev");

/// The current version of the application.
final kAppVersion = Version(
  major: kMajorAppVersion,
  minor: kMinorAppVersion,
  patch: kPatchAppVersion,
  build: kBuildNumber,
);
