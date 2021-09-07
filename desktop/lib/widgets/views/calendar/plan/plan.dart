import 'package:desktop/widgets/views/calendar/calendar_day.dart';
import 'package:desktop/widgets/views/calendar/modules/modules.dart';
import 'package:desktop/widgets/views/calendar/modules/modules_day.dart';
import 'package:desktop/widgets/views/calendar/plan/calendar_item.dart';
import 'package:desktop/widgets/views/calendar/plan/plan_widget.dart';
import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

class CalendarGrid extends StatelessWidget {
  CalendarGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Row(
        children: [
          PlanWidget(day: 'MON'),
          PlanWidget(day: 'TUE'),
          PlanWidget(day: 'WED'),
          PlanWidget(day: 'THU'),
          PlanWidget(day: 'FRI'),
          PlanWidget(day: 'SAT'),
          PlanWidget(day: 'SUN'),
        ],
      ),
    );
  }
}
