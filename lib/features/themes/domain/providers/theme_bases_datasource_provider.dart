import 'package:lb_planner/features/themes/themes.dart';
import 'package:lb_planner/features/themes/data/data.dart';
import 'package:riverpod/riverpod.dart';

/// Provides the current [ThemeBasesDataSource] instance.
final themeBasesDataSourceProvider = Provider<ThemeBasesDataSource>((ref) {
  return StdThemeBasesDataSource();
});
