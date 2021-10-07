import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

// ignore: camel_case_types
class NcCaptionText extends NcBaseText {
  NcCaptionText(
    String text, {
    Key? key,
    double? fontSize,
    bool buttonText = false,
    TextOverflow overflow = TextOverflow.ellipsis,
    TextAlign textAlign = TextAlign.left,
  }) : super(text, FontWeight.w600, key, fontSize, buttonText, overflow, textAlign);
}
