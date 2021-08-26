import 'package:flutter/material.dart';
import 'theme.dart';

//All Themes
class NcThemes {
  //Light Theme
  static final NcTheme light = NcTheme(
    primaryColor: Color(0xFFFFFFFF),
    secondaryColor: Color(0xFFF2F3F9),
    tertiaryColor: Color(0xFFCFCFCF),
    accentColor: Color(0xFF27BCF3),
    textColor: Color(0xFF1D1D1D),
    buttonTextColor: Color(0xFFFFFFFF),
  );

//Dark Theme
  static final NcTheme dark = NcTheme(
    primaryColor: Color(0xFF1D1D1D),
    secondaryColor: Color(0xFF2A2A2A),
    tertiaryColor: Color(0xFF444444),
    accentColor: Color(0xFF27BCF3),
    textColor: Color(0xFFFFFFFF),
  );

//Ocean Theme
  static final NcTheme ocean = NcTheme(
    primaryColor: Color(0xFF212942),
    secondaryColor: Color(0xFF262E48),
    tertiaryColor: Color(0xFF3D4C80),
    accentColor: Color(0xFF78A5FE),
    textColor: Color(0xFFFFFFFF),
  );

  static NcTheme _current = light;

  static NcTheme get current => _current;

  static set current(NcTheme theme) {
    _current = theme;
    onCurrentThemeChange?.call();
  }

  static Function? onCurrentThemeChange;

  static Map<String, NcTheme> get all => {"Dark": dark, "Light": light, "Ocean": ocean};
}
