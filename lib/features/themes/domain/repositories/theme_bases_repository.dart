import 'package:lb_planner/features/themes/themes.dart';

/// Base class for all theme repositories.
///
/// A theme repository is responsible for providing a list of [ThemeBase]s that can be used in the app.
/// It is also responsible for retrieving a [ThemeBase] by its name.
abstract class ThemeBasesRepository {
  /// Returns a list of [ThemeBase]s that can be used in the app.
  List<ThemeBase> getThemes();

  /// Returns the [ThemeBase] with the given [name].
  ///
  /// If no theme with the given [name] exists, a [defaultTheme] is returned.
  ///
  /// Note: [name] is case sensitive.
  ThemeBase getThemeByName(String name);

  /// Returns the default [ThemeBase].
  ThemeBase get defaultTheme;
}
