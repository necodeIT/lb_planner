import 'package:desktop/widgets/views/calendar/calendar_day.dart';
import 'package:desktop/widgets/views/calendar/plan/calendar_drag_item.dart';
import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

class PlanWidget extends StatelessWidget {
  PlanWidget({
    Key? key,
    required this.day,
  }) : super(key: key);

  final String day;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            flex: 0,
            child: NcCaptionText(
              day,
              fontSize: 20,
            ),
          ),
          Expanded(
            flex: 1,
            child: CalendarDayItem(
              text: '01',
              children: [
                CalendarDragItem(id: 01),
                CalendarDragItem(id: 01),
                CalendarDragItem(id: 01),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: CalendarDayItem(
              text: '01',
              children: [],
            ),
          ),
          Expanded(
            flex: 1,
            child: CalendarDayItem(
              text: '01',
              children: [],
            ),
          ),
          Expanded(
            flex: 1,
            child: CalendarDayItem(
              text: '01',
              children: [],
            ),
          ),
          Expanded(
            flex: 1,
            child: CalendarDayItem(
              text: '01',
              children: [],
            ),
          ),
        ],
      ),
    );
  }
}
