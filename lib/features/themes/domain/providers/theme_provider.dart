import 'package:lb_planner/features/auth/auth.dart';
import 'package:lb_planner/features/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

/// Provides the current [ThemeData] based on the current user's theme.
///
/// In order to change the theme, the user's theme name must be changed (see [userController]).
final themeProvider = Provider<ThemeData>((ref) {
  final themeService = ref.watch(themeServiceProvider);
  final themeBasesRepository = ref.watch(themeBasesRepositoryProvider);
  final user = ref.watch(userProvider);

  final themeBase = themeBasesRepository.getThemeByName(user?.themeName ?? "");

  return themeService.generateTheme(themeBase);
});
