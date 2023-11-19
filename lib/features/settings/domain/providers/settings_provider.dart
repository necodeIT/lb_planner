import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lb_planner/features/settings/settings.dart';
import 'package:lb_planner/features/auth/auth.dart';

/// Provides methods to change the [User]'s settings.
///
/// **NOTE:** This provider only provides methods to change the settings, as the current settings can be infered from the [User] object.
///
/// If you want to get the current settings, see [userProvider].
final settingsProvider = NotifierProvider(() {
  return SettingsProviderState();
});
