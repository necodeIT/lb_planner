import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

// ignore: camel_case_types
class NcCaptionText extends StatelessWidget {
  const NcCaptionText(this.text, {Key? key, this.fontSize, this.buttonText = false, this.overflow = TextOverflow.ellipsis}) : super(key: key);

  final String text;
  final double? fontSize;
  final bool buttonText;
  final TextOverflow overflow;

  static TextStyle get baseStyle {
    return TextStyle(fontWeight: FontWeight.w600, fontSize: 20, color: NcThemes.current.textColor);
  }

  static TextStyle style({double? fontSize, buttonText = false}) {
    return TextStyle(fontWeight: FontWeight.w600, fontSize: fontSize, color: buttonText ? NcThemes.current.buttonTextColor : NcThemes.current.textColor);
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style(fontSize: fontSize, buttonText: buttonText),
      overflow: overflow,
    );
  }
}
