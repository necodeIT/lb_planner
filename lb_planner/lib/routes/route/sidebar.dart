part of lbplanner_routes;

/// Sidbar for navigation.
class Sidebar extends StatelessWidget {
  /// Sidbar for navigation.
  const Sidebar({Key? key, required this.child}) : super(key: key);

  /// The current route.
  final Widget child;

  static const double width = 50;

  @override
  Widget build(BuildContext context) {
    return ConditionalWrapper(
      condition: false,
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
                      NcSpacing.medium(),
                      LpLogo(
                        size: 20,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      LpIcon(Icons.tab),
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

final RouteObserver<ModalRoute<void>> kRouteObserver = RouteObserver<ModalRoute<void>>();
