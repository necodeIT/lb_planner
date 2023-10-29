import 'package:lb_planner/features/themes/themes.dart';
import 'package:flutter/material.dart';

/// Implements [ThemeService] for [ThemeData].
class StdThemeService extends ThemeService<ThemeData> {
  @override
  ThemeData generateTheme(ThemeBase themeBase) {
    final templateTheme = ThemeData(brightness: themeBase.brightness);

    return ThemeData(
      brightness: themeBase.brightness,
      useMaterial3: false,
      primaryColor: themeBase.secondaryColor,
      dividerColor: themeBase.tertiaryColor,
      canvasColor: themeBase.primaryColor,
      iconTheme: templateTheme.iconTheme.copyWith(
        color: themeBase.textColor,
      ),
      extensions: <ThemeExtension<dynamic>>[
        ModuleStatusTheme(
          pendingColor: themeBase.modulePendingColor,
          uploadedColor: themeBase.moduleUploadedColor,
          lateColor: themeBase.errorColor,
          doneColor: themeBase.moduleDoneColor,
        )
      ],
      colorScheme: ColorScheme(
        primary: themeBase.accentColor,
        onPrimary: themeBase.onAccentColor,
        secondary: themeBase.accentColor,
        onSecondary: themeBase.onAccentColor,
        brightness: themeBase.brightness,
        error: themeBase.errorColor,
        onError: themeBase.onAccentColor,
        background: themeBase.secondaryColor,
        onBackground: themeBase.textColor,
        surface: themeBase.primaryColor,
        onSurface: themeBase.textColor,
      ),
      scaffoldBackgroundColor: themeBase.secondaryColor,
      textTheme: TextTheme(
        displayLarge: templateTheme.textTheme.displayLarge?.copyWith(
          color: themeBase.textColor,
        ),
        displayMedium: templateTheme.textTheme.displayMedium?.copyWith(
          color: themeBase.textColor,
        ),
        displaySmall: templateTheme.textTheme.displaySmall?.copyWith(
          color: themeBase.textColor,
        ),
        headlineMedium: templateTheme.textTheme.headlineMedium?.copyWith(
          color: themeBase.textColor,
        ),
        headlineSmall: templateTheme.textTheme.headlineSmall?.copyWith(
          color: themeBase.textColor,
        ),
        titleLarge: templateTheme.textTheme.titleLarge?.copyWith(
          color: themeBase.textColor,
        ),
        titleMedium: templateTheme.textTheme.titleMedium?.copyWith(
          color: themeBase.textColor,
        ),
        titleSmall: templateTheme.textTheme.titleSmall?.copyWith(
          color: themeBase.textColor,
        ),
        bodyLarge: templateTheme.textTheme.bodyLarge?.copyWith(
          color: themeBase.textColor,
        ),
        bodyMedium: templateTheme.textTheme.bodyMedium?.copyWith(
          color: themeBase.textColor,
        ),
        bodySmall: templateTheme.textTheme.bodySmall?.copyWith(
          color: themeBase.textColor,
        ),
        labelLarge: templateTheme.textTheme.labelLarge?.copyWith(
          color: themeBase.textColor,
        ),
        labelSmall: templateTheme.textTheme.labelSmall?.copyWith(
          color: themeBase.textColor,
        ),
      ),
    );
  }
}
