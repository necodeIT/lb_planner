import 'package:lb_planner/features/themes/themes.dart';
import 'package:lb_planner/features/themes/data/data.dart';
import 'package:riverpod/riverpod.dart';

/// Provides the current [ThemeBasesRepository] instance.
final themeBasesRepositoryProvider = Provider<ThemeBasesRepository>((ref) {
  final themeBasesDataSource = ref.watch(themeBasesDataSourceProvider);

  return StdThemeBasesRepository(themeBasesDataSource);
});
