part of lbplanner_routes;

/// Bar label for [DashboardStatusOverview].
class DashboardStatusOverviewBarLabel extends StatelessWidget {
  /// Bar label for [DashboardStatusOverview].
  const DashboardStatusOverviewBarLabel({Key? key, required this.color, required this.count}) : super(key: key);

  /// Color of the label.
  final Color color;

  /// The amount of modules that have this label.
  final int count;

  /// The label size.
  static const double size = 20;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(kRadius),
        boxShadow: kElevationToShadow[1],
      ),
      child: Center(
        child: NcTitleText(
          count.toString(),
          buttonText: true,
        ),
      ),
    );
  }
}
