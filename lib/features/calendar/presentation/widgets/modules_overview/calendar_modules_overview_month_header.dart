part of lbplanner_routes;

/// Month header
class CalendarModulesOverviewMonthHeader extends StatelessWidget {
  /// Month header
  const CalendarModulesOverviewMonthHeader({Key? key, required this.months}) : super(key: key);

  /// The months to display.
  final List<int> months;

  /// The width of the header.
  static const width = 40.0;

  /// Formatter for the month.
  static final formatter = DateFormat.MMM();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: primaryColor,
          width: width,
          height: CalendarCourseModulesOverview.courseHeight,
        ),
        for (var month in months)
          Expanded(
            child: Container(
              width: width,
              color: primaryColor,
              child: Center(
                child: NcTitleText(
                  formatter.format(DateTime(0, month)).characters.join('\n').toUpperCase(),
                  color: month == DateTime.now().month ? accentColor : textColor,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
