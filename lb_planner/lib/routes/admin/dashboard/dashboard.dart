part of lbplanner_routes;

/// The admin route.
class AdminDashboardRoute extends StatelessWidget {
  /// The admin route.
  const AdminDashboardRoute({Key? key}) : super(key: key);

  /// The name of the route.
  static const routeName = "/admin/dashboard";

  @override
  Widget build(BuildContext context) {
    return LpLoadingIndicator.penguin();
  }
}
