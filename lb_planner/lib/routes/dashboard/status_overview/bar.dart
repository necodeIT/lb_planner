part of lbplanner_routes;

/// Bar for [DashboardStatusOverviewChart].
class DashboardStatusOverviewBar extends StatelessWidget {
  /// Bar for [DashboardStatusOverviewChart].
  const DashboardStatusOverviewBar({Key? key, required this.width, required this.color}) : super(key: key);

  /// The width of the bar.
  final double width;

  /// The color of the bar.
  final Color color;

  /// The height of the bar.
  static const double height = 20;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(kRadius),
      ),
    );
  }
}
