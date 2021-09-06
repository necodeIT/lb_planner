import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:lb_planner/ui.dart';
import 'package:lb_planner/data.dart';

class CalendarSwitch extends StatelessWidget {
  CalendarSwitch({Key? key, required this.text, required this.onShowNext, required this.onGoBack, this.fontSize});

  final String text;
  final double? fontSize;

  final Function() onShowNext;
  final Function() onGoBack;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onGoBack,
          child: Icon(
            FontAwesome5Solid.chevron_left,
            color: NcThemes.current.textColor,
            size: fontSize,
          ),
        ),
        NcSpacing.xs(),
        NcCaptionText(
          text,
          fontSize: fontSize,
          textAlign: TextAlign.center,
        ),
        NcSpacing.xs(),
        GestureDetector(
          onTap: onShowNext,
          child: Icon(
            FontAwesome5Solid.chevron_right,
            color: NcThemes.current.textColor,
            size: fontSize,
          ),
        ),
      ],
    );
  }
}
