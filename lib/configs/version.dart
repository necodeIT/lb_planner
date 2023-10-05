/// This library contains configurations related to the version and build channel of the app.
library configs.version;

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

/// Holds the version of the application as a string.
/// The value is read from the compile-time variable `APP_VERSION`.
///
/// Defaults to `0.0.0` if the compile-time variable is not set.
///
/// In order to set the variable use `--dart-define` when building the app:
///
/// ```bash
/// flutter build [os] --dart-define=APP_VERSION=`VALUE`
/// ```
const kAppVersion =
    String.fromEnvironment("APP_VERSION", defaultValue: "0.0.0");

/// Holds the build number as a string, sourced from the `BUILD_NUMBER` compile-time variable.
///
/// In [BuildChannel.dev] or [BuildChannel.beta], the version number usually stays the same until a stable release.
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

/// Enum representing the different build channels the app can be in.
enum BuildChannel {
  /// Development channel, usually the most up-to-date but least stable.
  dev,

  ///  Beta channel, more stable than `dev` but may still have issues.
  beta,

  /// Stable channel, the most stable version available for users.
  stable,
}

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
