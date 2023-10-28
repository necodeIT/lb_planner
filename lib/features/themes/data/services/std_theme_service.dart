import 'package:lb_planner/features/themes/themes.dart';
import 'package:flutter/material.dart';

/// Implements [ThemeService] for [ThemeData].
class StdThemeService extends ThemeService<ThemeData> {
  @override
  ThemeData generateTheme(ThemeBase themeBase) {
    // TODO: check if there are any other properties that need to be set
    return ThemeData(
      useMaterial3: false,
      unselectedWidgetColor: themeBase.tertiaryColor,
      primaryColor: themeBase.secondaryColor,
      primaryColorDark: themeBase.primaryColor,
      primaryColorLight: themeBase.tertiaryColor,
      dividerColor: themeBase.tertiaryColor,
      colorScheme: ColorScheme(
        primary: themeBase.secondaryColor,
        secondary: themeBase.accentColor,
        surface: themeBase.primaryColor,
        background: themeBase.secondaryColor,
        error: themeBase.errorColor,
        onPrimary: themeBase.onAccentColor,
        onSecondary: themeBase.onAccentColor,
        onSurface: themeBase.onAccentColor,
        onBackground: themeBase.onAccentColor,
        onError: themeBase.onAccentColor,
        brightness: themeBase.brightness,
      ),
    );
  }
}
