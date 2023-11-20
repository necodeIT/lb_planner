import 'package:lb_planner/features/auth/auth.dart';
import 'package:lb_planner/features/themes/themes.dart';
import 'package:lb_planner/shared/shared.dart';

/// Provides methods to change the [User]'s settings.
///
/// **NOTE:** This provider only provides methods to change the settings, as the current settings can be inferred from the [User] object.
///
/// If you want to get the current settings, see [userProvider].
class SettingsProviderState {
  /// The user to change the settings of.
  late User? user;

  /// The controller used for updating the user.
  late UserProvider controller;

  /// The service used for accessing the app directory.
  ///
  /// Used for clearing the cache.
  late AppDirService appDirService;

  /// Provides methods to change the [User]'s settings.
  ///
  /// **NOTE:** This provider only provides methods to change the settings, as the current settings can be inferred from the [User] object.
  ///
  /// If you want to get the current settings, see [userProvider].
  SettingsProviderState(this.user, this.controller, this.appDirService);

  /// Clears the cache.
  ///
  /// This will log the user out, and delete all data from the device.
  ///
  /// The user will have to log in again.
  Future<void> clearCache() async {
    final dir = await appDirService.resolveApplicationDirectory();

    await dir.delete(recursive: true);
  }

  /// Deletes the account from the server and clears the cache.
  ///
  /// This will log the user out, and delete all data from the device.
  ///
  /// The user will have to create a new account.
  Future<void> deleteAccount() async {
    _assertLoggedIn();

    await controller.deleteUser();

    await clearCache();
  }

  /// Sets the theme of the user.
  ///
  /// Will be synced to the server.
  Future<void> setTheme(ThemeBase theme) async {
    _assertLoggedIn();

    await controller.updateUser(user!.copyWith(themeName: theme.name));
  }

  _assertLoggedIn() {
    if (user == null) {
      throw Exception("User is not logged in");
    }
  }
}
