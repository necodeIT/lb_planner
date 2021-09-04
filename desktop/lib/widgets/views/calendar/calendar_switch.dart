import 'package:desktop/widgets/views/calendar/calendar/calendar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:lb_planner/ui.dart';
import 'package:lb_planner/data.dart';

class CalenderSwitch extends StatelessWidget {
  CalenderSwitch({
    Key? key,
    required this.text,
    required this.onShowNext,
    required this.onGoBack,
  });

  final String text;

  final Function() onShowNext;
  final Function() onGoBack;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150, //TODO: Weg löschn
      width: 300, //TODO: Weg löschn
      child: Row(
        children: [
          GestureDetector(
            onTap: onGoBack,
            child: Icon(
              FontAwesome5Solid.chevron_left,
              color: NcThemes.current.textColor,
            ),
          ),
          NcSpacing.small(),
          NcCaptionText(text, fontSize: 30),
          NcSpacing.small(),
          GestureDetector(
            onTap: onShowNext,
            child: Icon(
              FontAwesome5Solid.chevron_right,
              color: NcThemes.current.textColor,
            ),
          ),
        ],
      ),
    );
  }
}
