part of lbplanner_routes;

/// Modules overview route.
class CalendarModulesOverviewRoute extends StatelessWidget {
  /// Modules overview route.
  const CalendarModulesOverviewRoute({Key? key}) : super(key: key);

  /// The route name.
  static const routeName = "calendar/modules-overview";

  @override
  Widget build(BuildContext context) {
    return Calendar(child: LpLoadingIndicator.circular());
  }
}
