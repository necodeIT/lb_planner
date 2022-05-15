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
  static const double size = 22;

  /// The max count that can be displayed.
  static const int max = 99;

  @override
  Widget build(BuildContext context) {
    var cap = count > max;
    var text = min(max, count).toString();
    text += cap ? "+" : "";

    return ConditionalWrapper(
      condition: cap,
      wrapper: (context, child) => Tooltip(
        message: count.toString(),
        child: child,
        // ignore: no-magic-number
        textStyle: NcBaseText.style(buttonText: true, fontSize: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kRadius),
          color: color,
        ),
      ),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(kRadius),
        ),
        child: Center(
          child: NcTitleText(
            text,
            buttonText: true,
            // ignore: no-magic-number
            fontSize: cap ? 10 : null,
          ),
        ),
      ),
    );
  }
}
