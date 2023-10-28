import 'package:lb_planner/features/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

/// Provides the current [ThemeData].
///
/// In order to set the theme, use [themeController].
final themeProvider =
    StateNotifierProvider<ThemeProviderState<ThemeData>, ThemeData>((ref) {
  final themeService = ref.watch(themeServiceProvider);
  final themeBasesRepository = ref.watch(themeBasesRepositoryProvider);

  return ThemeProviderState<ThemeData>(themeService, themeBasesRepository);
});

/// Provides methods to change the current theme.
///
/// In order to get the current theme, use [themeProvider].
final themeController = themeProvider.notifier;
