part of lbplanner_routes;

/// Sidbar for navigation.
class Sidebar extends StatelessWidget {
  /// Sidbar for navigation.
  const Sidebar({Key? key, required this.child}) : super(key: key);

  /// The current route.
  final Widget child;

  /// The width of the sidebar.
  static const double width = 60;

  @override
  Widget build(BuildContext context) {
    return ConditionalWrapper(
      condition: currentRoute != LoginRoute.routeName,
      wrapper: (context, child) {
        return Row(
          children: [
            Container(
              width: width,
              color: primaryColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      NcSpacing.small(),
                      LpLogo(
                        size: SidebarItem.size,
                      ),
                      NcSpacing.small(),
                      SidebarItem(
                        icon: Icons.settings,
                        route: DashboardRoute.routeName,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SidebarItem(
                        icon: Icons.settings,
                        route: "",
                      ),
                      NcSpacing.medium(),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: child,
            ),
          ],
        );
      },
      child: child,
    );
  }
}

/// All routes the app has
final Map<String, WidgetBuilder> kRoutes = {
  LoginRoute.routeName: (context) => LoginRoute(),
  DashboardRoute.routeName: (context) => DashboardRoute(),
};

/// Observes navigation events.
final RouteObserver<ModalRoute<void>> kRouteObserver = RouteObserver<ModalRoute<void>>();
