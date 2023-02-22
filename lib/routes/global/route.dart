part of lbplanner_routes;

/// The current route that was pushed.
RouteInfo get currentRoute => RouteWrapper.currentRoute;

/// The parameters for the current route.
RouteArgs get currentRouteArgs => RouteWrapper.currentRouteArgs;

/// Wraps a route in a Sidebar and a scaffold.
class RouteWrapper extends StatelessWidget {
  /// Wraps a route in a Sidebar and a scaffold.
  const RouteWrapper({Key? key, required this.child}) : super(key: key);

  /// The child to wrap.
  final Widget child;

  static RouteInfo _currentRoute = LoginRoute.info;
  static RouteArgs _currentRouteArgs = RouteArgs({});

  /// The current route that was pushed.
  static RouteInfo get currentRoute => _currentRoute;

  /// The parameters for the current route.
  static RouteArgs get currentRouteArgs => _currentRouteArgs;

  static RouteInfo? _cachedOnlineRoute;
  static RouteArgs? _cachedOnlineRouteArgs;

  /// Generates a route.
  static PageRouteBuilder gnerateRoute(RouteSettings settings) {
    _currentRoute = kRoutes[settings.name] ?? RouteInfo(routeName: settings.name ?? '', builder: (_, __) => NcTitleText("404"));

    log("Navigating to '${currentRoute.routeName}'", LogTypes.tracking);

    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => Center(
        child: currentRoute.build(
          context,
          _currentRouteArgs = RouteArgs.fromRouteSettings(settings),
        ),
      ),
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
    return Consumer(builder: (context, ref, _) {
      initGuard(ref);
      var connected = ref.watch(internetProvider);
      var user = ref.watch(userProvider);
      var update = ref.watch(updateProvider).copyWith(updateAvailable: true);

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (connected && currentRoute == OfflineRoute.info) (_cachedOnlineRoute ?? DashboardRoute.info).push(context, params: _cachedOnlineRouteArgs?.args);
        if (!connected && currentRoute != OfflineRoute.info) {
          _cachedOnlineRoute = currentRoute;
          _cachedOnlineRouteArgs = currentRouteArgs;
          OfflineRoute.info.push(context);
        }

        if (user.invalid && currentRoute != LoginRoute.info && connected && !update.updateAvailable) LoginRoute.info.push(context);
        if (update.updateAvailable && currentRoute != UpdateRoute.info && connected) UpdateRoute.info.push(context);
      });

      return ContextMenuOverlay(
        buttonBuilder: (context, config, [_]) => HoverBuilder(
          builder: (_, hover) => Padding(
            padding: const EdgeInsets.all(NcSpacing.xsSpacing),
            child: Row(
              children: [
                if (config.icon != null && !(config.iconHover != null && hover)) config.icon!,
                if (config.iconHover != null && hover) config.iconHover!,
                if (config.icon != null) NcSpacing.small(),
                NcCaptionText(config.label),
              ],
            ),
          ),
          onTap: config.onPressed,
        ),
        cardBuilder: (context, children) => Container(
          padding: const EdgeInsets.all(NcSpacing.xsSpacing),
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(kRadius),
            boxShadow: kElevationToShadow[3],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: children,
          ),
        ),
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            backgroundColor: secondaryColor,
            body: Sidebar(
              child: ConditionalWrapper(
                condition: !currentRoute.standalone,
                wrapper: RouteTitle.builder,
                child: child,
              ),
            ),
          ),
        ),
      );
    });
  }
}
