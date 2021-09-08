import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'theme.dart';

//All Themes
class NcThemes {
  //Light Theme
  static final NcTheme light = NcTheme(
    "Light",
    primaryColor: Color(0xFFFFFFFF),
    secondaryColor: Color(0xFFF2F3F9),
    tertiaryColor: Color(0xFFCFCFCF),
    accentColor: Color(0xFF27BCF3),
    textColor: Color(0xFF1D1D1D),
    buttonTextColor: Color(0xFFFFFFFF),
    icon: Icons.wb_sunny,
    iconColor: Colors.amber,
  );

  //Dark Theme
  static final NcTheme dark = NcTheme(
    "Dark",
    primaryColor: Color(0xFF1D1D1D),
    secondaryColor: Color(0xFF2A2A2A),
    tertiaryColor: Color(0xFF444444),
    accentColor: Color(0xFF27BCF3),
    textColor: Color(0xFFFFFFFF),
    icon: FontAwesome5Solid.moon,
    iconColor: Colors.white,
  );

//Ocean Theme
  static final NcTheme ocean = NcTheme(
    "Ocean",
    primaryColor: Color(0xFF212942),
    secondaryColor: Color(0xFF262E48),
    tertiaryColor: Color(0xFF3D4C80),
    accentColor: Color(0xFF78A5FE),
    textColor: Color(0xFFF8F2F2),
    doneColor: Color(0xFF208767),
    uploadedColor: Color(0xFFCCB941),
    lateColor: Color(0xFFD15C4F),
    pendingColor: Color(0xFF626D6E),
    icon: FontAwesome5Solid.tint,
    iconColor: Color(0xFF78A5FE),
  );

  static final NcTheme sakura = NcTheme(
    "桜",
    primaryColor: Color(0xFFFCE9EB),
    secondaryColor: Color(0xFFF3DCDB),
    tertiaryColor: Color(0xFFfde0d8),
    accentColor: Color(0xFFF3A39E),
    textColor: Color(0xFF8C5E6B),
    buttonTextColor: Color(0xFFFCE9EB),
    doneColor: Color(0xFFB2C959),
    uploadedColor: Color(0xFFE5D75A),
    lateColor: Color(0xFFC26161),
    pendingColor: Color(0xFFE0BAC0),
    icon: FontAwesome5Solid.tree,
    iconColor: Color(0xFFF3A39E),
  );

  static NcTheme _current = light;

  static NcTheme get current => _current;

  static set current(NcTheme theme) {
    _current = theme;
    onCurrentThemeChange?.call();
  }

  static Function? onCurrentThemeChange;

  static final Map<String, NcTheme> all = {
    dark.name: dark,
    light.name: light,
    ocean.name: ocean,
    sakura.name: sakura
  };
}
