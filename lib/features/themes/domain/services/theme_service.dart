import 'package:lb_planner/features/themes/themes.dart';
import 'package:lb_planner/shared/shared.dart';

/// Base class for all theme services.
///
/// A theme service takes a [ThemeBase] and generates a fully fledged theme of type [T] from it.
abstract class ThemeService<T> extends Service {
  /// Initializes a new instance of [ThemeService] with logging set up.
  ThemeService() : super("Theme");

  /// Generates a fully fledged theme of type [T] from the given [themeBase].
  T generateTheme(ThemeBase themeBase);
}
