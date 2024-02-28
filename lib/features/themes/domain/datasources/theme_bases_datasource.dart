import 'package:lb_planner/features/themes/themes.dart';
import 'package:lb_planner/shared/shared.dart';

/// Base class for all base themes data sources.
///
/// A base themes data source provides a list of [ThemeBase]s that can be used in the app.
abstract class ThemeBasesDataSource extends DataSource {
  /// Initializes a new instance of [ThemeBasesDataSource] with logging set up.
  ThemeBasesDataSource() : super("ThemeBases");

  /// Returns a list of [ThemeBase]s that can be used in the app.
  List<ThemeBase> getThemes();

  /// Returns the default [ThemeBase].
  ThemeBase get defaultTheme;
}
