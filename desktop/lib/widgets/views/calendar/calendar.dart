import 'package:desktop/dialogs/edit_course_dialog.dart';
import 'package:desktop/dialogs/not_implemented_dialog.dart';
import 'package:desktop/widgets/views/calendar/calendar_switch.dart';
import 'package:desktop/widgets/views/calendar/modules/module_grid.dart';
import 'package:desktop/widgets/views/calendar/modules/route.dart';
import 'package:desktop/widgets/views/calendar/plan/plan.dart';
import 'package:desktop/widgets/views/calendar/plan/route.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

class CalendarView extends StatelessWidget {
  const CalendarView({Key? key}) : super(key: key);

  static const double fontSize = 22;

  static const List<String> routes = [PlanRoute.name, OverviewRoute.name];

  static dropDown(BuildContext context, String current) => NcDropdown(
        fontSize: CalendarView.fontSize,
        onValueChanged: (index) {
          NcView.of(context).route(routes[index]);
        },
        items: routes,
        value: routes.indexOf(current),
      );

  @override
  Widget build(BuildContext context) {
    return NcView(
      routes: [
        NcView.route(
          title: "Calendar",
          customRouteName: PlanRoute.name,
          content: PlanRoute(),
        ),
        NcView.route(
          title: "Calendar",
          customRouteName: OverviewRoute.name,
          content: OverviewRoute(),
        ),
      ],
    );
  }
}
