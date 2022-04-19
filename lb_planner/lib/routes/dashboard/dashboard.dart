part of lbplanner_routes;

/// Dashboard route.
class DashboardRoute extends StatelessWidget {
  /// Dashboard route.
  const DashboardRoute({Key? key}) : super(key: key);

  /// Name of the route.
  static const String routeName = '/dashboard';

  @override
  Widget build(BuildContext context) {
    var filler = LpContainer(
      child: Center(child: NcTitleText("Test")),
    );
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Expanded(child: filler),
              NcSpacing.medium(),
              Expanded(child: filler),
            ],
          ),
        ),
        NcSpacing.medium(),
        Expanded(
          flex: 2,
          child: Column(
            children: [
              Expanded(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 125),
                  child: DashboardStatusOverview(),
                ),
              ),
              NcSpacing.medium(),
              Expanded(flex: 3, child: filler),
            ],
          ),
        ),
        NcSpacing.medium(),
        Expanded(
          child: Column(
            children: [
              Expanded(child: filler),
              NcSpacing.medium(),
              Expanded(child: filler),
            ],
          ),
        ),
      ],
    );
  }
}
