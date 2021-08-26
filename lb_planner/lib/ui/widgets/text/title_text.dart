import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

// ignore: camel_case_types
class NcTitleText extends StatelessWidget {
  const NcTitleText(this.text, {Key? key, this.fontSize, this.buttonText = false, this.textColor}) : super(key: key);

  final String text;
  final double? fontSize;
  final bool buttonText;
  final Color? textColor;

  static TextStyle get baseStyle {
    return TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: NcThemes.current.textColor);
  }

  static TextStyle style({double? fontSize, buttonText = false, Color? textColor}) {
    return TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize, color: buttonText ? NcThemes.current.buttonTextColor : textColor ?? NcThemes.current.textColor);
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style(fontSize: fontSize, buttonText: buttonText),
    );
  }
}
