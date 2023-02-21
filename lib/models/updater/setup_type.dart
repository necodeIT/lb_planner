part of lbplanner_engine;

/// Different types of setups used to install the app.
enum SetupType {
  /// The app was installed from a Setup.dmg file.
  dmg,

  /// The app was installed through a Setup.exe file.
  exe,

  /// The app was not installed but is packed in an AppImage.
  appImage,

  /// The app was installed from aur package.
  aur,

  /// The app was installed from aur-git package.
  aurGit,

  /// The app was compiled from source.
  selfCompiled,
}

/// Provides a [fromString] method to convert a string to a [SetupType].
extension SetupTypeFromString on SetupType {
  /// The String type of the [SetupType] used to install this app.
  /// The environment variable must be set at compile time using `--dart-define` during the build process.
  ///
  /// e.g. for a dmg build:
  /// ```
  /// flutter build macos --dart-define=LB_PLANNER_SETUP_TYPE=dmg
  /// ```
  ///
  /// e.g. for a exe build:
  ///
  /// ```
  /// flutter build windows --dart-define=LB_PLANNER_SETUP_TYPE=exe
  /// ```
  ///
  /// e.g. for a appimage build:
  ///
  /// ```
  /// flutter build linux --dart-define=LB_PLANNER_SETUP_TYPE=appimage
  /// ```
  ///
  /// e.g. for a aur build:
  ///
  /// ```
  /// flutter build linux --dart-define=LB_PLANNER_SETUP_TYPE=aur
  /// ```
  ///
  /// e.g. for a aur-git build:
  ///
  /// ```
  /// flutter build linux --dart-define=LB_PLANNER_SETUP_TYPE=aur-git
  /// ```
  static const kSetupType = String.fromEnvironment('LB_PLANNER_SETUP_TYPE');

  /// Returns a [SetupType] from a string.
  static SetupType fromString(String? type) {
    switch (type) {
      case 'dmg':
        return SetupType.dmg;
      case 'exe':
        return SetupType.exe;
      case 'appimage':
        return SetupType.appImage;
      case 'aur':
        return SetupType.aur;
      case 'aur-git':
        return SetupType.aurGit;
      default:
        return SetupType.selfCompiled;
    }
  }

  /// Returns a [SetupType] from the environment.
  static SetupType fromEnvironment() {
    return fromString(kSetupType);
  }
}
