part of lbplanner_routes;

/// Settings route.
class SettingsRoute extends StatelessWidget {
  /// Settings route.
  const SettingsRoute({Key? key}) : super(key: key);

  /// Route name.
  static const routeName = "/settings";

  @override
  Widget build(BuildContext context) {
    return LpProgressindicator.penguin();
  }
}
