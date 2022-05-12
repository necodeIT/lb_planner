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

    return Consumer(builder: (context, ref, _) {
      var plan = ref.watch(planProvider);

      return AnimatedContainer(
        padding: const EdgeInsets.all(NcSpacing.xsSpacing),
        duration: kNormalAnimationDuration,
        decoration: BoxDecoration(
          border: Border.all(
            color: tertiaryColor,
            width: widget.isCurrentMonth ? 0.5 : 0.2,
          ),
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(NcSpacing.xsSpacing),
                child: NcBodyText(
                  formatter.format(widget.day),
                  textAlign: TextAlign.center,
                  color: isToday
                      ? accentColor
                      : widget.isCurrentMonth
                          ? textColor
                          : textColor.withOpacity(0.7),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                controller: ScrollController(),
                children: [
                  if (plan.loading) ...[
                    LpShimmer(),
                    NcSpacing.xs(),
                    LpShimmer(),
                    NcSpacing.xs(),
                    LpShimmer(),
                    NcSpacing.xs(),
                  ] else
                    for (var deadline in plan.deadlines.values) ...[
                      ModuleWidget.status(moduleId: deadline.moduleId),
                      NcSpacing.xs(),
                    ],
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
