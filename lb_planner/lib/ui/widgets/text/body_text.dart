import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

class NcBodyText extends StatelessWidget {
  const NcBodyText({Key? key, required this.text, this.fontSize = 20, this.buttonText = false}) : super(key: key);

  final double fontSize;
  final String text;
  final bool buttonText;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontWeight: FontWeight.normal, fontSize: fontSize, color: buttonText ? NcThemes.current.buttonTextColor : NcThemes.current.textColor),
    );
  }
}
