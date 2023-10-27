/// Enum for the different install mediums the app can be installed with.
enum InstallMedium {
  /// The app was installed from the arch user repository.
  ///
  /// Operating systems:
  ///
  /// - Linux
  aur,

  /// The app was self compiled.
  ///
  /// Operating systems:
  ///
  /// - Windows
  /// - Linux
  /// - macOS
  selfCompiled,

  /// The app was installed from a windows setup file.
  ///
  /// Operating systems:
  ///
  /// - Windows
  innoSetup,

  /// The app was downloaded for linux from the website as an AppImage.
  ///
  /// Operating systems:
  ///
  /// - Linux
  appImage,

  /// The app was installed from a dmg file.
  ///
  /// Operating systems:
  ///
  /// - macOS
  dmg,
}
