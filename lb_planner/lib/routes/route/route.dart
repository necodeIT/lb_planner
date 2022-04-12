part of lbplanner_routes;

/// Wraps a route in a Sidebar and a scaffold.
class RouteWrapper extends StatelessWidget {
  /// Wraps a route in a Sidebar and a scaffold.
  const RouteWrapper({Key? key, required this.child}) : super(key: key);

  /// The child to wrap.
  final Widget child;

  static String _currentRoute = '';

  /// The current route that was pushed.
  static String get currentRoute => _currentRoute;

  /// Generates a route.
  static PageRouteBuilder gnerateRoute(RouteSettings settings) {
    _currentRoute = settings.name ?? '';
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => kRoutes[settings.name]?.call(context) ?? Container(color: errorColor),
      transitionsBuilder: (context, animation, secondaryAnimation, child) => RouteWrapper(
        child: FadeThroughTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          child: child,
          fillColor: secondaryColor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: Sidebar(child: child),
    );
  }
}

/// The current route that was pushed.
String get currentRoute => RouteWrapper.currentRoute;
