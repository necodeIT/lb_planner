import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lb_planner/shared/shared.dart';

/// Navigation bar for [CalendarPlanMonth].
class CalendarPlanMonthNavigator extends StatelessWidget {
  /// Navigation bar for [CalendarPlanMonth].
  const CalendarPlanMonthNavigator(
      {Key? key,
      required this.onNextMonth,
      required this.onPreviousMonth,
      required this.currentMonth,
      required this.onToday})
      : super(key: key);

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
          builder: (_, hover) => Icon(
            Icons.chevron_left,
            size: Calendar.fontSize,
            color: hover ? accentColor : null,
          ),
        ),
        Spacing.small(),
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
        Spacing.small(),
        HoverBuilder(
          onTap: onNextMonth,
          builder: (_, hover) => Icon(
            Icons.chevron_right,
            size: Calendar.fontSize,
            color: hover ? accentColor : null,
          ),
        ),
      ],
    );
  }
}
