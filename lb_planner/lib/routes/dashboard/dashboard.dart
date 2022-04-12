part of lbplanner_routes;

/// Dashboard route.
class DashboardRoute extends StatelessWidget {
  /// Dashboard route.
  const DashboardRoute({Key? key}) : super(key: key);

  /// Name of the route.
  static const String routeName = '/dashboard';

  @override
  Widget build(BuildContext context) {
    var filler = Container(
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(kRadius),
        boxShadow: kElevationToShadow[4],
      ),
      child: Center(child: NcTitleText("Test")),
      width: double.infinity,
    );
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Expanded(flex: 1, child: filler),
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
              Expanded(child: filler),
              NcSpacing.medium(),
              Expanded(flex: 3, child: filler),
            ],
          ),
        ),
        NcSpacing.medium(),
        Expanded(
          flex: 1,
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
