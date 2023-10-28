import 'package:lb_planner/features/themes/themes.dart';

/// Base class for all theme services.
///
/// A theme service takes a [ThemeBase] and generates a fully fledged theme of type [T] from it.
abstract class ThemeService<T> {
  /// Generates a fully fledged theme of type [T] from the given [themeBase].
  T generateTheme(ThemeBase themeBase);
}
