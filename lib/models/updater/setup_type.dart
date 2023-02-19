part of lbplanner_engine;

/// Different types of setups used to install the app.
enum SetupType {
  /// The app was installed from a Setup.dmg file.
  dmg,

  /// The app was installed through a Setup.exe file.
  exe,

  /// The app was not installed but is packed from an AppImage.
  appimage,

  /// The app was installed via yay package manager.
  yay,
}

/// Provides a [fromString] method to convert a string to a [SetupType].
extension SetupTypeFromString on SetupType {
  /// Returns a [SetupType] from a string.
  static SetupType fromString(String? type) {
    switch (type) {
      case 'dmg':
        return SetupType.dmg;
      case 'exe':
        return SetupType.exe;
      case 'appimage':
        return SetupType.appimage;
      case 'yay':
        return SetupType.yay;
      default:
        throw ArgumentError('Unknown SetupType: $type');
    }
  }
}
