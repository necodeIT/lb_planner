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
  static final formatter = DateFormat.MMMMd();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        children: [
          for (var month in months) Expanded(child: NcTitleText(formatter.format(DateTime(0, month)))),
        ],
      ),
    );
  }
}
