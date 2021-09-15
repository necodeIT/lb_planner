import 'package:desktop/widgets/views/calendar/calendar_day.dart';
import 'package:desktop/widgets/views/calendar/plan/calendar_drag_item.dart';
import 'package:flutter/material.dart';
import 'package:lb_planner/data.dart';
import 'package:lb_planner/ui.dart';

class PlanWidget extends StatefulWidget {
  PlanWidget({
    Key? key,
    required this.day,
  }) : super(key: key);

  final String day;

  @override
  State<PlanWidget> createState() => _PlanWidgetState();
}

class _PlanWidgetState extends State<PlanWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            flex: 0,
            child: NcCaptionText(
              widget.day,
              fontSize: 20,
            ),
          ),
          Expanded(
            flex: 1,
            child: CalendarDayItem(
              text: '01',
              onItemDroped: (id) => User.current.plan.moduleDates[id] = DateTime.now(),
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
