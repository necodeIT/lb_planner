part of lbplanner_routes;

/// Navigation bar for [CalendarPlanMonth].
class CalendarPlanMonthNavigator extends StatelessWidget {
  /// Navigation bar for [CalendarPlanMonth].
  const CalendarPlanMonthNavigator({Key? key, required this.onNextMonth, required this.onPreviousMonth, required this.currentMonth, required this.onToday}) : super(key: key);

  /// Callback for the next month button.
  final VoidCallback onNextMonth;

  /// Callback for the previous month button.
  final VoidCallback onPreviousMonth;

  /// Callback for the today button.
  final VoidCallback onToday;

  /// The current month to display.
  final DateTime currentMonth;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        HoverBuilder(
          onTap: onPreviousMonth,
          builder: (_, hover) => LpIcon(
            Icons.chevron_left,
            size: Calendar.fontSize,
            color: hover ? accentColor : null,
          ),
        ),
        NcSpacing.small(),
        Center(
          child: HoverBuilder(
            onTap: onToday,
            builder: (_, hover) => NcCaptionText(
              DateFormat("MMMM yyyy").format(currentMonth),
              fontSize: Calendar.fontSize,
              color: hover ? accentColor : null,
            ),
          ),
        ),
        NcSpacing.small(),
        HoverBuilder(
          onTap: onNextMonth,
          builder: (_, hover) => LpIcon(
            Icons.chevron_right,
            size: Calendar.fontSize,
            color: hover ? accentColor : null,
          ),
        ),
      ],
    );
  }
}
