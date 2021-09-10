import 'package:desktop/dialogs/not_implemented_dialog.dart';
import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

import '../calendar.dart';
import '../calendar_switch.dart';
import 'plan.dart';

class PlanRoute extends StatelessWidget {
  const PlanRoute({Key? key}) : super(key: key);

  static const name = "Plan";

  @override
  Widget build(BuildContext context) {
    return NcContainer.window(
      contentPadding: false,
      label: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // dont touch
              CalendarView.dropDown(context, name),
              GestureDetector(
                onTap: () {
                  showPlaceHolderDialog(context); // direct assingment no worky worky dunno why
                },
                child: Icon(
                  Icons.more_horiz,
                  size: CalendarView.fontSize,
                  color: NcThemes.current.textColor,
                ),
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
      body: CalendarGrid(),
    );
  }
}
