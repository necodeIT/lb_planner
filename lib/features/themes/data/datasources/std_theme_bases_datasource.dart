import 'package:flutter/material.dart';
import 'package:lb_planner/features/themes/themes.dart';

/// Standard implementation of [ThemeBasesDataSource].
class StdThemeBasesDataSource extends ThemeBasesDataSource {
  @override
  ThemeBase get defaultTheme => ThemeBase(
        primaryColor: Color(0xFFFFFFFF),
        secondaryColor: Color(0xFFF2F3F9),
        tertiaryColor: Color(0xFFCFCFCF),
        accentColor: Color(0xFF27BCF3),
        onAccentColor: Color(0xFFFFFFFF),
        errorColor: Color(0xFFF1C40F),
        successColor: Color(0xFF4FB930),
        disabledColor: Color(0xFF7F8C8D),
        textColor: Color(0xFF1D1D1D),
        name: "Light",
        icon: Icons.wb_sunny,
        iconColor: Colors.amber,
        brightness: Brightness.light,
      );

  @override
  List<ThemeBase> getThemes() {
    return [
      defaultTheme,
    ];
  }
}
