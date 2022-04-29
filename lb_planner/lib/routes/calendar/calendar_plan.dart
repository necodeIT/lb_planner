part of lbplanner_routes;

/// Calendar plan route.
class CalendarPlanRoute extends StatelessWidget {
  /// Calendar plan route.
  const CalendarPlanRoute({Key? key}) : super(key: key);

  /// Route name.
  static const routeName = "/calendar/plan";

  @override
  Widget build(BuildContext context) {
    return LpLoadingIndicator.penguin();
  }
}
