import 'package:flutter/material.dart';
import 'package:lb_planner/features/themes/themes.dart';
import 'package:lb_planner/features/themes/data/data.dart';
import 'package:riverpod/riverpod.dart';

/// Provides the current [ThemeService] instance.
final themeServiceProvider = Provider<ThemeService<ThemeData>>((ref) {
  return StdThemeService();
});
