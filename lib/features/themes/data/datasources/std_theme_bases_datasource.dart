import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
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
        errorColor: Color(0xFFE74C3C),
        moduleUploadedColor: Color(0xFFF1C40F),
        moduleDoneColor: Color(0xFF4FB930),
        modulePendingColor: Color(0xFF7F8C8D),
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

      // Dark theme
      ThemeBase(
        primaryColor: Color(0xFF1D1D1D),
        secondaryColor: Color(0xFF2C2C2C),
        tertiaryColor: Color(0xFF3C3C3C),
        accentColor: Color(0xFF27BCF3),
        onAccentColor: Color(0xFFFFFFFF),
        errorColor: Color(0xFFE74C3C),
        moduleUploadedColor: Color(0xFFF1C40F),
        moduleDoneColor: Color(0xFF4FB930),
        modulePendingColor: Color(0xFF7F8C8D),
        textColor: Color(0xFFFFFFFF),
        name: "Dark",
        icon: Icons.nights_stay,
        iconColor: Colors.blueGrey,
        brightness: Brightness.dark,
      ),

      // Ocean theme
      ThemeBase(
        brightness: Brightness.dark,
        primaryColor: Color(0xFF212942),
        secondaryColor: Color(0xFF262E48),
        tertiaryColor: Color(0xFF3D4C80),
        accentColor: Color(0xFF78A5FE),
        textColor: Color(0xFFF8F2F2),
        onAccentColor: Color(0xFFF8F2F2),
        moduleDoneColor: Color(0xFF208767),
        moduleUploadedColor: Color(0xFFCCB941),
        errorColor: Color(0xFFD15C4F),
        modulePendingColor: Color(0xFF626D6E),
        name: "Ocean",
        icon: FontAwesome5Solid.tint,
        iconColor: Color(0xFF78A5FE),
      ),

      // 桜 theme
      ThemeBase(
        brightness: Brightness.light,
        primaryColor: Color(0xFFFCE9EB),
        secondaryColor: Color(0xFFF3DCDB),
        tertiaryColor: Color(0xFFECBDB0),
        accentColor: Color(0xFFF3A39E),
        textColor: Color(0xFF8C5E6B),
        onAccentColor: Color(0xFFFCE9EB),
        moduleDoneColor: Color(0xFFB2C959),
        moduleUploadedColor: Color(0xFFE5D75A),
        errorColor: Color(0xFFC26161),
        modulePendingColor: Color(0xFFE0BAC0),
        icon: FontAwesome5Solid.tree,
        name: "桜",
        iconColor: Color(0xFFF3A39E),
      ),
      ThemeBase(
        primaryColor: Color(0xFFC2F0C2),
        secondaryColor: Color(0xFFF2F2F2),
        tertiaryColor: Color(0xFFE0E0E0),
        accentColor: Color(0xFF89CFF0),
        onAccentColor: Color(0xFFffffff),
        errorColor: Color(0xFFF8D7DA),
        moduleDoneColor: Color(0xFFD4EDDA),
        modulePendingColor: Color(0xFFEDEDED),
        moduleUploadedColor: Color(0xFFFFE8A1),
        textColor: Color(0xFF000000),
        name: 'Pastel',
        icon: Icons.palette,
        iconColor: Color(0xFFF8D7DA),
        brightness: Brightness.light,
      ),
    ];
  }
}
