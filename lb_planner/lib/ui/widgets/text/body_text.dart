import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

class NcBodyText extends NcBaseText {
  NcBodyText(
    String text, {
    Key? key,
    double? fontSize,
    bool buttonText = false,
    TextOverflow overflow = TextOverflow.ellipsis,
    TextAlign textAlign = TextAlign.left,
  }) : super(text, FontWeight.normal, key, fontSize, buttonText, overflow, textAlign);
}
