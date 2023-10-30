import 'package:lb_planner/features/themes/themes.dart';

/// Standard implementation of [ThemeBasesRepository].
class StdThemeBasesRepository extends ThemeBasesRepository {
  /// The [ThemeBasesDataSource] that is used to retrieve the [ThemeBase]s.s
  final ThemeBasesDataSource themeBasesDataSource;

  /// Standard implementation of [ThemeBasesRepository].
  StdThemeBasesRepository(this.themeBasesDataSource);

  @override
  ThemeBase getThemeByName(String name) {
    var themes = themeBasesDataSource.getThemes();

    return themes.firstWhere(
      (element) => element.name == name,
      orElse: () => themeBasesDataSource.defaultTheme,
    );
  }

  @override
  List<ThemeBase> getThemes() => themeBasesDataSource.getThemes();

  @override
  ThemeBase get defaultTheme => themeBasesDataSource.defaultTheme;
}
