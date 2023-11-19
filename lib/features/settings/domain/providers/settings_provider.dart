import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lb_planner/features/settings/settings.dart';
import 'package:lb_planner/features/auth/auth.dart';
import 'package:lb_planner/shared/shared.dart';

/// Provides methods to change the [User]'s settings.
///
/// **NOTE:** This provider only provides methods to change the settings, as the current settings can be infered from the [User] object.
///
/// If you want to get the current settings, see [userProvider].
final settingsProvider = Provider<SettingsProviderState>((ref) {
  final user = ref.watch(userProvider);
  final controller = ref.watch(userController);
  final appDirService = ref.watch(appDirServiceProvider);

  return SettingsProviderState(user, controller, appDirService);
});
