part of lbplanner_routes;

/// The admin route.
class AdminRoute extends StatelessWidget {
  /// The admin route.
  const AdminRoute({Key? key}) : super(key: key);

  /// The name of the route.
  static const routeName = "/admin";

  @override
  Widget build(BuildContext context) {
    return LpLoadingIndicator.penguin();
  }
}
