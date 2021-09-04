import 'package:desktop/widgets/views/calendar/calendar/calendar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:lb_planner/ui.dart';
import 'package:lb_planner/data.dart';

class CalenderDayItem extends StatelessWidget {
  CalenderDayItem({
    Key? key,
    required this.text,
    required this.children,
  });

  final String text;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150, //TODO: Weg löschn
      width: 200, //TODO: Weg löschn
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
              child: ListView(
            children: children
            // CalendarItem(id: 1),
            // CalendarItem(id: 1),
            // CalendarItem(id: 1),
            ,
          )),
          NcCaptionText(
            '01',
            fontSize: 20,
            //textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }
}
