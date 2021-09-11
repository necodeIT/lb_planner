import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:lb_planner/ui.dart';
import 'package:lb_planner/data.dart';

class CalendarDayItem extends StatelessWidget {
  CalendarDayItem({
    Key? key,
    required this.text,
    required this.children,
  });

  final String text;
  final List<Widget> children;

  static const double padding = 5;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: NcThemes.current.tertiaryColor,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: padding, right: padding, left: padding),
              child: ListView(children: children),
            ),
          ),
          NcCaptionText(
            text,
            fontSize: 20,
            //textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }
}
