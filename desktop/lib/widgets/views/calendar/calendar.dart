import 'package:desktop/dialogs/edit_course_dialog.dart';
import 'package:desktop/dialogs/not_implemented_dialog.dart';
import 'package:desktop/widgets/views/calendar/calendar_switch.dart';
import 'package:desktop/widgets/views/calendar/plan/plan.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({Key? key}) : super(key: key);

  static const double fontSize = 22;

  @override
  _CalendarViewState createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  CalendarState state = CalendarState.Plan;

  @override
  Widget build(BuildContext context) {
    return NcView.route(
      title: "Calendar",
      content: NcContainer.window(
        contentPadding: false,
        label: Stack(
          alignment: Alignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NcDropdown(
                  fontSize: CalendarView.fontSize,
                  onValueChanged: (index) {
                    setState(() {
                      state = CalendarState.values[index];
                    });
                  },
                  items: EnumToString.toList(CalendarState.values),
                  value: 0,
                ),
                // dont touch
                if (state == CalendarState.Plan)
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
                  text: state == CalendarState.Plan ? "Test1" : "Test2",
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
        body: state == CalendarState.Plan ? CalendarGrid() : NcLoadingIndicator(),
      ),
    );
  }
}

enum CalendarState { Plan, Modules }
