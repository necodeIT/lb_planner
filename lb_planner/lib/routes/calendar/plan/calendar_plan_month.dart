part of lbplanner_routes;

/// Month grid for the calendar.
class CalendarPlanMonth extends LocalizedWidget {
  /// Month grid for the calendar.
  const CalendarPlanMonth({Key? key, required this.month}) : super(key: key);

  /// The month to display.
  final DateTime month;

  /// The number of rows to display.
  static const int rows = 6;

  @override
  Widget create(context, t) {
    /// List of all days in the month.
    final days = List<DateTime>.generate(
      DateTime(month.year, month.month + 1, 0).day,
      (i) => DateTime(month.year, month.month, i + 1),
    );

    /// List of all days in the previous month.
    final prevDays = List<DateTime>.generate(
      DateTime(month.year, month.month, 0).day,
      (i) => DateTime(month.year, month.month - 1, i + 1),
    );

    /// List of all days in the next month.
    final nextDays = List<DateTime>.generate(
      DateTime(month.year, month.month + 2, 0).day,
      (i) => DateTime(month.year, month.month + 1, i + 1),
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

    for (var i = 0; i < rows; i++) {
      weeks.add([]);

      if (i == 0) {
        var missingDays = days.first.weekday - DateTime.monday;

        weeks[i].addAll(prevDays.reversed.toList().sublist(0, missingDays).reversed);

        insertedDays += DateTime.daysPerWeek - missingDays;

        weeks[i].addAll(days.sublist(0, insertedDays));
      } else if (i == rows - 1) {
        var missingDays = insertedDays == days.length ? insertedNextDays + DateTime.daysPerWeek : DateTime.sunday - days.last.weekday;

        weeks[i].addAll(days.sublist(insertedDays, days.length));
        weeks[i].addAll(nextDays.sublist(insertedNextDays, missingDays));
      } else {
        var daysToInsert = min(insertedDays + DateTime.daysPerWeek, days.length);
        weeks[i].addAll(days.sublist(insertedDays, daysToInsert));

        insertedDays = daysToInsert;

        if (insertedDays == days.length) {
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
                      isCurrentMonth: day.month == month.month,
                    ),
                  ),
              ],
            ),
          ),
      ],
    );
  }
}
