import 'dart:io';

import 'package:lb_planner/shared/domain/services/app_dir_service.dart';

/// `LocalConfigService` is an abstract class designed to manage local configuration files.
/// It provides a generic interface for loading and saving configuration data of type [T].
///
/// This class leverages [AppDirService] to determine the directory where the configuration file should be stored.
///
/// Example:
/// ```dart
/// class MyConfigService extends LocalConfigService<MyConfig> {
///   MyConfigService(AppDirService appDirService) : super(appDirService, "my_config.json");
///   // Implement loadConfig and saveConfig methods
/// }
/// ```
abstract class LocalConfigService<T> {
  /// The name of the configuration file.
  final String fileName;

  /// An instance of [AppDirService] used to determine the directory for storing the configuration file.
  final AppDirService appDirService;

  /// `LocalConfigService` is an abstract class designed to manage local configuration files.
  /// It provides a generic interface for loading and saving configuration data of type [T].
  ///
  /// This class leverages [AppDirService] to determine the directory where the configuration file should be stored.
  ///
  /// Example:
  /// ```dart
  /// class MyConfigService extends LocalConfigService<MyConfig> {
  ///   MyConfigService(AppDirService appDirService) : super(appDirService, "my_config.json");
  ///   // Implement loadConfig and saveConfig methods
  /// }
  /// ```
  LocalConfigService(this.appDirService, this.fileName);

  /// Returns a [Future] that resolves to a [File] object representing the configuration file.
  ///
  /// The method uses [AppDirService] to find the application directory and then locates the configuration file within it.
  ///
  /// Example:
  /// ```dart
  /// var configFile = await myConfigService.configFile;
  /// ```
  Future<File> resolveConfigFile() async {
    var dir = await appDirService.resolveApplicationDirectory();

    return File("${dir.path}/$fileName");
  }

  /// Abstract method to load the configuration data.
  ///
  /// Implementations should read the configuration file and return the configuration data as an object of type [T].
  Future<T> loadConfig();

  /// Abstract method to save the configuration data.
  ///
  /// Implementations should serialize the configuration data of type [T] and write it to the configuration file.
  ///
  /// - [config]: The configuration data to save.
  Future<void> saveConfig(T config);

  /// Returns a [Future] that resolves to `true` if the configuration can be loaded and `false` otherwise.
  ///
  /// Default implementation checks if the configuration file exists however this may be overridden.
  Future<bool> canLoadConfig() async {
    var configFile = await resolveConfigFile();

    return configFile.existsSync();
  }
}
