part of lbplanner_routes;

/// Navigation bar for [CalendarPlanMonth].
class CalendarPlanMonthNavigator extends StatelessWidget {
  /// Navigation bar for [CalendarPlanMonth].
  const CalendarPlanMonthNavigator({Key? key, required this.onNextMonth, required this.onPreviousMonth, required this.currentMonth}) : super(key: key);

  /// Callback for the next month button.
  final VoidCallback onNextMonth;

  /// Callback for the previous month button.
  final VoidCallback onPreviousMonth;

  /// The current month to display.
  final DateTime currentMonth;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onPreviousMonth,
          child: LpIcon(Icons.chevron_left),
        ),
        Center(
          child: NcTitleText(
            DateFormat("MMMM yyyy").format(currentMonth),
          ),
        ),
        GestureDetector(
          onTap: onNextMonth,
          child: LpIcon(Icons.chevron_right),
        ),
      ],
    );
  }
}
