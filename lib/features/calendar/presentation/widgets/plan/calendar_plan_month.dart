import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lb_planner/shared/shared.dart';

/// Month grid for the calendar.
class CalendarPlanMonth extends StatefulWidget {
  /// Month grid for the calendar.
  const CalendarPlanMonth({Key? key, required this.month}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CalendarPlanMonthState();

  /// The month to display.
  final DateTime month;

  /// The number of rows to display.
  final int rows = 6;
}

class _CalendarPlanMonthState extends State<CalendarPlanMonth> {
  @override
  Widget build(context) {
    /// List of all days in the month.
    final days = List<DateTime>.generate(
      DateTime(widget.month.year, widget.month.month + 1, 0).day,
      (i) => DateTime(widget.month.year, widget.month.month, i + 1),
    );

    /// List of all days in the previous month.
    final prevDays = List<DateTime>.generate(
      DateTime(widget.month.year, widget.month.month, 0).day,
      (i) => DateTime(widget.month.year, widget.month.month - 1, i + 1),
    );

    /// List of all days in the next month.
    final nextDays = List<DateTime>.generate(
      DateTime(widget.month.year, widget.month.month + 2, 0).day,
      (i) => DateTime(widget.month.year, widget.month.month + 1, i + 1),
    );

    final List<String> weekDaysNames = [
      t.calendar_plan_monday,
      t.calendar_plan_tuesday,
      t.calendar_plan_wednesday,
      t.calendar_plan_thursday,
      t.calendar_plan_friday,
      t.calendar_plan_saturday,
      t.calendar_plan_sunday,
    ];

    List<List<DateTime>> weeks = [];

    var insertedDays = 0;
    var insertedNextDays = 0;

    for (var i = 0; i < widget.rows; i++) {
      weeks.add([]);

      if (i == 0) {
        /// Fill up the first week with days from the previous month.
        var missingDays = days.first.weekday - DateTime.monday;

        weeks[i].addAll(
            prevDays.reversed.toList().sublist(0, missingDays).reversed);

        insertedDays += DateTime.daysPerWeek - missingDays;

        weeks[i].addAll(days.sublist(0, insertedDays));
      } else if (i == widget.rows - 1) {
        /// Fill up the last week with days from the next month.
        var missingDays = insertedDays == days.length
            ? insertedNextDays + DateTime.daysPerWeek
            : DateTime.sunday - days.last.weekday;

        weeks[i].addAll(days.sublist(insertedDays, days.length));
        weeks[i].addAll(nextDays.sublist(insertedNextDays, missingDays));
      } else {
        /// Fill up the rest of the weeks with days from the current month.
        var daysToInsert =
            min(insertedDays + DateTime.daysPerWeek, days.length);
        weeks[i].addAll(days.sublist(insertedDays, daysToInsert));

        insertedDays = daysToInsert;

        if (insertedDays == days.length) {
          /// If all days have been inserted, insert the next days from the next month.
          var missingDays = DateTime.sunday - days.last.weekday;

          weeks[i].addAll(nextDays.sublist(0, missingDays));

          insertedNextDays = missingDays;
        }
      }
    }

    return Column(
      children: [
        SizedBox(
          height: CalendarCourseModulesOverview.courseHeight,
          child: Row(
            children: [
              for (var weekDay in weekDaysNames)
                Expanded(
                  child: NcTitleText(
                    weekDay,
                    textAlign: TextAlign.center,
                  ),
                ),
            ],
          ),
        ),
        for (var week in weeks)
          Expanded(
            child: Row(
              children: [
                for (var day in week)
                  Expanded(
                    child: CalendarPlanCell(
                      day: day,
                      isCurrentMonth: day.month == widget.month.month,
                    ),
                  ),
              ],
            ),
          ),
      ],
    );
  }
}
