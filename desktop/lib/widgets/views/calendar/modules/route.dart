import 'package:desktop/dialogs/not_implemented_dialog.dart';
import 'package:desktop/widgets/views/calendar/modules/module_grid.dart';
import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

import '../calendar.dart';
import '../calendar_switch.dart';

class OverviewRoute extends StatelessWidget {
  const OverviewRoute({Key? key}) : super(key: key);

  static const name = "Modules";

  @override
  Widget build(BuildContext context) {
    return NcContainer.window(
      contentPadding: false,
      label: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            children: [
              NcDropdown(
                fontSize: CalendarView.fontSize,
                onValueChanged: (index) {
                  NcView.of(context).route(CalendarView.routes[index]);
                },
                items: CalendarView.routes,
                // value: CalendarView.routes.indexOf(name),
                value: CalendarView.routes.indexOf(name),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CalendarSwitch(
                text: "Test1",
                onShowNext: () {
                  print("next");
                },
                onGoBack: () {
                  print("back");
                },
                fontSize: CalendarView.fontSize,
              ),
            ],
          ),
        ],
      ),
      // body: ModuleGrid(),
      body: ModuleGrid(),
    );
    // return Container(color: Colors.amber);
  }
}
