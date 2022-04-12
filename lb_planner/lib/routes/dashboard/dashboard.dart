part of lbplanner_routes;

/// Dashboard route.
class DashboardRoute extends StatelessWidget {
  /// Dashboard route.
  const DashboardRoute({Key? key}) : super(key: key);

  /// Name of the route.
  static const String routeName = '/dashboard';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: successColor,
    );
  }
}
