part of lbplanner_routes;

/// A section on the admin dashboard.
class AdminDashboardSection extends StatelessWidget {
  /// A section on the admin dashboard.
  const AdminDashboardSection({Key? key, required this.route, required this.svg, required this.icon}) : super(key: key);

  /// The route of this section.
  final RouteInfo route;

  /// The svg of this section.
  final String svg;

  /// The icon of this section.
  final IconData icon;

  /// The scale on hover.
  static const hoverScale = 1.01;

  /// The height of the section.
  static const double height = 250;

  /// The width of the section.
  static const double width = 400;

  @override
  Widget build(BuildContext context) {
    return ScaleOnHover(
      onTap: () => route.push(context),
      duration: kFastAnimationDuration,
      scale: hoverScale,
      child: LpContainer(
        width: width,
        height: height,
        leading: LpIcon(icon, size: LpContainer.titleFontSize),
        title: route.title(context),
        child: NcVectorImage(code: svg),
      ),
    );
  }
}
