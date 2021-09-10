import 'package:desktop/widgets/views/calendar/calendar_day.dart';
import 'package:desktop/widgets/views/calendar/modules/modules.dart';
import 'package:desktop/widgets/views/calendar/modules/modules_day.dart';
import 'package:desktop/widgets/views/calendar/plan/calendar_drag_item.dart';
import 'package:desktop/widgets/views/calendar/plan/calendar_item.dart';
import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

class ModuleWidget extends StatelessWidget {
  ModuleWidget({
    Key? key,
    required this.tag,
  }) : super(key: key);

  final String tag;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            flex: 0,
            child: Container(
              child: NcCaptionText(
                tag,
                fontSize: 20,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: CalenderDayItem(
              dayModules: '+1',
              text: 'text',
              children: [
                // CalendarDragItem(id: 01),
                // CalendarDragItem(id: 01),
                // CalendarDragItem(id: 01),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: CalenderDayItem(
              dayModules: '+1',
              text: 'text',
              children: [],
            ),
          ),
          Expanded(
            flex: 1,
            child: CalenderDayItem(
              dayModules: '+1',
              text: 'text',
              children: [],
            ),
          ),
          Expanded(
            flex: 1,
            child: CalenderDayItem(
              dayModules: '+1',
              text: 'text',
              children: [],
            ),
          ),
          Expanded(
            flex: 1,
            child: CalenderDayItem(
              dayModules: '+1',
              text: 'text',
              children: [],
            ),
          ),
        ],
      ),
    );
  }
}
