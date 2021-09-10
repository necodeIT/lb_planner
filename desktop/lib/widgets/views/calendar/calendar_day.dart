import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:lb_planner/ui.dart';
import 'package:lb_planner/data.dart';

class CalenderDayItem extends StatelessWidget {
  CalenderDayItem({
    Key? key,
    required this.text,
    required this.children,
    required this.dayModules,
  });

  final String text;
  final String dayModules;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 100, //TODO: Weg löschn
      //width: 200, //TODO: Weg löschn
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
              padding: EdgeInsets.only(top: 5, right: 2, left: 2),
              child: ListView(
                children: children,
                // CalendarItem(id: 1),
                // CalendarItem(id: 1),
                // CalendarItem(id: 1),
              ),
            ),
          ),
          NcCaptionText(
            dayModules,
            fontSize: 20,
            //textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }
}
