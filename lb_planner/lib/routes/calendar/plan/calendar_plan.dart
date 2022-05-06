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

  DateTime lastMonth = DateTime.now();

  DateTime month = DateTime.now();

  void _nextMonth() {
    setState(() {
      lastMonth = month;
      month = DateTime(month.year, month.month + 1, 1);
    });
  }

  void _prevMonth() {
    setState(() {
      lastMonth = month;
      month = DateTime(month.year, month.month - 1, 1);
    });
  }

  void _today() {
    setState(() {
      lastMonth = month;
      month = DateTime.now();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Calendar(
      header: Expanded(
        child: Row(
          children: [
            Expanded(
              child: CalendarPlanMonthNavigator(
                onToday: _today,
                onNextMonth: _nextMonth,
                onPreviousMonth: _prevMonth,
                currentMonth: month,
              ),
            ),
            LpPopup(
              popupBuilder: (context, close) => CalendarPlanDropdown(),
              backgroundDismissable: false,
              child: LpIcon(Icons.more_horiz),
            ),
          ],
        ),
      ),
      child: PageTransitionSwitcher(
        reverse: lastMonth.isBefore(month),
        duration: kSlowAnimationDuration,
        child: CalendarPlanMonth(
          month: month,
          key: ValueKey(month),
        ),
        transitionBuilder: (child, primaryAnimation, secondaryAnimation) => SharedAxisTransition(
          animation: primaryAnimation,
          secondaryAnimation: secondaryAnimation,
          transitionType: SharedAxisTransitionType.horizontal,
          child: child,
          fillColor: primaryColor,
        ),
      ),
    );

    // return Calendar(child: CalendarPlanMonth(month: DateTime.now()));
  }
}
