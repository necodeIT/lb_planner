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

  final _calendar = CellCalendarPageController();

  @override
  Widget build(BuildContext context) {
    // return Calendar(
    //   header: Row(
    //     children: [
    //       Expanded(
    //         child: NcCaptionText(
    //           _calendar.,
    //           fontSize: 18,
    //         ),
    //       ),

    //     ],
    //   ),
    //   child: CellCalendar(

    //     cellCalendarPageController: _calendar,
    //     todayMarkColor: accentColor,
    //     todayTextColor: buttonTextColor,
    //     dateTextStyle: NcBaseText.style(fontSize: null),
    //     daysOfTheWeekBuilder: (day) => Center(
    //       child: NcTitleText(
    //         formatter.format(
    //           DateTime(0, 0, day),
    //         ),
    //         fontSize: 15,
    //       ),
    //     ),
    //     monthYearLabelBuilder: (_) => SizedBox.shrink(),
    //   ),
    // );

    return Calendar(child: CalendarPlanMonth(month: DateTime.now()));
  }
}
