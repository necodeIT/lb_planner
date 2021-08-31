import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

class NcBodyText extends StatelessWidget {
  const NcBodyText(this.text, {Key? key, this.fontSize, this.buttonText = false, this.overflow = TextOverflow.ellipsis, this.textAlign = TextAlign.left}) : super(key: key);

  final double? fontSize;
  final String text;
  final bool buttonText;
  final TextOverflow overflow;
  final TextAlign textAlign;
  static TextStyle get baseStyle {
    return TextStyle(fontWeight: FontWeight.normal, fontSize: 20, color: NcThemes.current.textColor);
  }

  static TextStyle style({double? fontSize = 20, buttonText = false}) {
    return TextStyle(fontWeight: FontWeight.normal, fontSize: fontSize, color: buttonText ? NcThemes.current.buttonTextColor : NcThemes.current.textColor);
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style(fontSize: fontSize, buttonText: buttonText),
      overflow: overflow,
      textAlign: textAlign,
    );
  }
}
