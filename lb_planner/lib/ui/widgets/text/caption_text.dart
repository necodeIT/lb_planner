import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

// ignore: camel_case_types
class NcCaptionText extends StatelessWidget {
  const NcCaptionText(this.text, {Key? key, this.fontSize = 20, this.buttonText = false}) : super(key: key);

  final String text;
  final double fontSize;
  final bool buttonText;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontWeight: FontWeight.w600, fontSize: fontSize, color: buttonText ? NcThemes.current.buttonTextColor : NcThemes.current.textColor),
    );
  }
}
