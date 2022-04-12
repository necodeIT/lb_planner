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

  /// Whether the current route is [LoginRoute.routeName].
  static bool get isLogin => _currentRoute == LoginRoute.routeName;

  /// Generates a route.
  static PageRouteBuilder gnerateRoute(RouteSettings settings) {
    _currentRoute = settings.name ?? '';

    log("Navigating to '$currentRoute'", LogTypes.tracking);

    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => Center(child: kRoutes[settings.name]?.call(context) ?? NcTitleText("404")),
      transitionsBuilder: (context, animation, secondaryAnimation, child) => RouteWrapper(
        child: SharedAxisTransition(
          transitionType: SharedAxisTransitionType.vertical,
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
      body: Sidebar(
        child: ConditionalWrapper(
          condition: !isLogin,
          wrapper: RouteTitle.builder,
          child: child,
        ),
      ),
    );
  }
}
