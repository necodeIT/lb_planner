part of lbplanner_routes;

/// Dashboard route.
class DashboardRoute extends StatelessWidget {
  /// Dashboard route.
  const DashboardRoute({Key? key}) : super(key: key);

  /// Info about this route.
  static final info = RouteInfo(routeName: "/dashboard", builder: (_, __) => DashboardRoute(), titleGenerator: (t) => t.dashboard_routeName);

  /// The height of the [DashboardStatusOverview] section.
  static const double statusOverViewHeight = 100;

  @override
  Widget build(BuildContext context) {
    var filler = TBAContainer();

    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Expanded(child: DashboardTodaysTasks()),
              NcSpacing.medium(),
              Expanded(child: filler),
            ],
          ),
        ),
        NcSpacing.medium(),
        Expanded(
          // ignore: no-magic-number
          flex: 2,
          child: Column(
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: statusOverViewHeight),
                child: DashboardStatusOverview(),
              ),
              NcSpacing.medium(),
              // ignore: no-magic-number
              Expanded(flex: 3, child: filler),
            ],
          ),
        ),
        NcSpacing.medium(),
        Expanded(
          child: Column(
            children: [
              Expanded(child: DashboardExams()),
              NcSpacing.medium(),
              Expanded(child: filler),
            ],
          ),
        ),
      ],
    );
  }
}
