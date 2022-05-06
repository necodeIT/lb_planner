part of lbplanner_routes;

/// Calendar plan route.
class CalendarPlanRoute extends StatefulWidget {
  /// Calendar plan route.
  const CalendarPlanRoute({Key? key}) : super(key: key);

  /// Route name.
  static const routeName = "/calendar/plan";

  @override
  State<CalendarPlanRoute> createState() => _CalendarPlanRouteState();
}

class _CalendarPlanRouteState extends State<CalendarPlanRoute> {
  final formatter = DateFormat("EEE");

  DateTime month = DateTime.now();

  void _nextMonth() {
    setState(() {
      month = DateTime(month.year, month.month + 1, 1);
    });
  }

  void _prevMonth() {
    setState(() {
      month = DateTime(month.year, month.month - 1, 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Calendar(
      header: Expanded(
        child: Row(
          children: [
            CalendarPlanMonthNavigator(onNextMonth: _nextMonth, onPreviousMonth: _prevMonth, currentMonth: month),
          ],
        ),
      ),
      child: CalendarPlanMonth(month: month),
    );

    // return Calendar(child: CalendarPlanMonth(month: DateTime.now()));
  }
}
