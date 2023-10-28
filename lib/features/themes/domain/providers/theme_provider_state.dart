import 'package:lb_planner/features/themes/themes.dart';
import 'package:riverpod/riverpod.dart';

/// Exposes the current theme.
class ThemeProviderState<T> extends StateNotifier<T> {
  /// The [ThemeService] that is used to generate the theme.
  final ThemeService<T> themeService;

  /// The [ThemeBasesRepository] that is used to retrieve the [ThemeBase]s.
  final ThemeBasesRepository themeBasesRepository;

  /// The [ThemeBase] that was used to generate the current theme.
  late ThemeBase currentThemeBase;

  /// Exposes the current theme.
  ThemeProviderState(
    this.themeService,
    this.themeBasesRepository,
  ) : super(themeService.generateTheme(themeBasesRepository.defaultTheme)) {
    currentThemeBase = themeBasesRepository.defaultTheme;
  }

  /// Sets the theme to the theme with the given [name].
  ///
  /// If no theme with the given [name] exists, the default theme is used.
  ///
  /// Note: [name] is case sensitive.
  void setThemeByName(String name) {
    currentThemeBase = themeBasesRepository.getThemeByName(name);

    state = themeService.generateTheme(currentThemeBase);
  }

  /// Sets the theme to the theme with the given [themeBase].
  void setTheme(ThemeBase themeBase) {
    currentThemeBase = themeBase;

    state = themeService.generateTheme(currentThemeBase);
  }
}
