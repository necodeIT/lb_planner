part of lbplanner_routes;

/// Cell of the calendar view.
class CalendarPlanCell extends StatefulWidget {
  /// Cell of the calendar view.
  const CalendarPlanCell({Key? key, required this.day, required this.isCurrentMonth}) : super(key: key);

  /// The day this cell represents.
  final DateTime day;

  /// Whether this cell is in the current month.
  final bool isCurrentMonth;

  @override
  State<CalendarPlanCell> createState() => _CalendarPlanCellState();
}

class _CalendarPlanCellState extends State<CalendarPlanCell> {
  final DateFormat formatter = DateFormat.d();

  @override
  Widget build(BuildContext context) {
    bool isToday = widget.day.year == DateTime.now().year && widget.day.month == DateTime.now().month && widget.day.day == DateTime.now().day;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: widget.isCurrentMonth ? tertiaryColor : tertiaryColor.withOpacity(0.8),
          width: 0.5,
        ),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(NcSpacing.xsSpacing),
              child: ConditionalWrapper(
                condition: isToday,
                wrapper: (context, child) => Container(
                  padding: const EdgeInsets.all(NcSpacing.xsSpacing),
                  decoration: BoxDecoration(
                    color: accentColor,
                    shape: BoxShape.circle,
                  ),
                  child: child,
                ),
                child: NcBodyText(
                  formatter.format(widget.day),
                  color: isToday
                      ? buttonTextColor
                      : widget.isCurrentMonth
                          ? textColor
                          : textColor.withOpacity(0.7),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
