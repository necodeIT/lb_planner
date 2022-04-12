part of lbplanner_routes;

/// Wraps a route in a Sidebar and a scaffold.
class RouteWrapper extends StatelessWidget {
  /// Wraps a route in a Sidebar and a scaffold.
  const RouteWrapper({Key? key, required this.child}) : super(key: key);

  /// The child to wrap.
  final Widget child;

  /// Wraps a route in a Sidebar and a scaffold.
  static Widget wrap(BuildContext context, Widget? child) => RouteWrapper(child: child!);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: Sidebar(child: child),
    );
  }
}
