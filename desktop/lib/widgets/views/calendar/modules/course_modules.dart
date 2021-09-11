import 'package:desktop/widgets/views/calendar/calendar_day.dart';
import 'package:desktop/widgets/views/calendar/modules/module_day.dart';
import 'package:desktop/widgets/views/calendar/modules/modules.dart';
import 'package:desktop/widgets/views/calendar/modules/modules_day.dart';
import 'package:desktop/widgets/views/calendar/plan/calendar_drag_item.dart';
import 'package:desktop/widgets/views/calendar/plan/calendar_item.dart';
import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

class CourseModules extends StatelessWidget {
  CourseModules({
    Key? key,
    required this.id,
  }) : super(key: key);

  final int id;
  static const double tagHeight = 30;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            height: tagHeight,
            alignment: Alignment.center,
            //width: double.infinity,
            color: Colors.red,
            child: NcCaptionText(
              'SEW',
              fontSize: 20,
              buttonText: true,
            ),
          ),
          Expanded(
            child: CalendarDayItem(
              text: "3",
              children: [
                ModuleItem(id: 01),
              ],
            ),
          ),
          Expanded(
            child: CalendarDayItem(
              text: "3",
              children: [
                ModuleItem(id: 01),
              ],
            ),
          ),
          Expanded(
            child: CalendarDayItem(
              text: "3",
              children: [
                ModuleItem(id: 01),
              ],
            ),
          ),
          Expanded(
            child: CalendarDayItem(
              text: "3",
              children: [
                ModuleItem(id: 01),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
