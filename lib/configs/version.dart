/// This library contains configurations related to the version and build channel of the app.
library configs.version;

/// Holds the name of the application.
/// The value is read from the environment variable `APP_NAME`.
///
/// Defaults to `LB Planner` if the environment variable is not set.
const kAppName = String.fromEnvironment("APP_NAME", defaultValue: "LB Planner");

/// Holds the name of the application version.
/// The value is read from the environment variable `APP_VERSION_NAME`.
///
/// Defaults to `Debug ver.` if the environment variable is not set.
const kAppVersionName =
    String.fromEnvironment("APP_VERSION_NAME", defaultValue: "Debug ver.");

/// Holds the version of the application as a string.
/// The value is read from the environment variable `APP_VERSION`.
///
/// Defaults to `0.0.0` if the environment variable is not set.
const kAppVersion =
    String.fromEnvironment("APP_VERSION", defaultValue: "0.0.0");

/// Holds the build number as a string, sourced from the `BUILD_NUMBER` environment variable.
///
/// In [BuildChannel.dev] or [BuildChannel.beta], the version number usually stays the same until a stable release.
/// The build number helps us and the users differentiate between different builds of the same version.
///
/// The value is read from the environment variable `BUILD_NUMBER`.
///
/// Defaults to `0` if the environment variable is not set.
const kBuildNumber = String.fromEnvironment("BUILD_NUMBER", defaultValue: "0");

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
/// The value is read from the environment variable `BUILD_CHANNEL`.
///
/// Defaults to [BuildChannel.dev] if the environment variable is not set.
final kBuildChannel = BuildChannel.values.byName(_kBuildChannel);

const _kBuildChannel =
    String.fromEnvironment("BUILD_CHANNEL", defaultValue: "dev");
