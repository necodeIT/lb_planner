part of lbplanner_routes;

class AdminRoute extends StatelessWidget {
  const AdminRoute({Key? key}) : super(key: key);

  /// The name of the route.
  static const routeName = "/admin";

  @override
  Widget build(BuildContext context) {
    return LpLoadingIndicator.penguin();
  }
}
