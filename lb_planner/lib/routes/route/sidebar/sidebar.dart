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
      condition: !isLogin,
      wrapper: (context, child) {
        return Consumer(builder: (context, ref, _) {
          var user = ref.watch(userProvider);
          var showAdmin = user.accessLevel.isAdmin || user.accessLevel.isModerator;

          return Row(
            children: [
              Container(
                width: width,
                decoration: BoxDecoration(
                  color: primaryColor,
                  boxShadow: [
                    /// Scuffed fixing so that the shadow does not overlap the [WindowHandle].
                    BoxShadow(offset: Offset(0, 3.0), blurRadius: 3.0, spreadRadius: -2.0, color: _kKeyUmbraOpacity),
                    BoxShadow(offset: Offset(0, 3.0), blurRadius: 4.0, color: _kKeyPenumbraOpacity),
                    BoxShadow(offset: Offset(0, 1.0), blurRadius: 8.0, color: _kAmbientShadowOpacity),
                    BoxShadow(color: primaryColor, offset: Offset(0, -8)),
                    BoxShadow(color: primaryColor, offset: Offset(0, 16)),
                    BoxShadow(color: primaryColor, offset: Offset(-16, -8)),
                    BoxShadow(color: primaryColor, offset: Offset(-16, 16)),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        NcSpacing.small(),
                        SidebarItem(
                          icon: FontAwesome.bars,
                          route: DashboardRoute.routeName,
                        ),
                        NcSpacing.small(),
                        SidebarItem(
                          icon: Icons.calendar_month_rounded,
                          route: CalendarPlanRoute.routeName,
                          routes: const [CalendarModulesOverviewRoute.routeName],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        if (kDebugMode)
                          SidebarItem(
                            icon: FontAwesome.flask,
                            route: TestRoute.routeName,
                          ),
                        if (kDebugMode) NcSpacing.small(),
                        if (showAdmin)
                          SidebarItem(
                            icon: Icons.admin_panel_settings,
                            route: AdminRoute.routeName,
                          ),
                        if (showAdmin) NcSpacing.small(),
                        SidebarItem(
                          icon: Icons.settings,
                          route: SettingsRoute.routeName,
                        ),
                        NcSpacing.small(),
                        SidebarItem(
                          icon: Icons.logout,
                          route: LoginRoute.routeName,
                          onTap: ref.read(userProvider.notifier).logout,
                        ),
                        NcSpacing.medium(),
                      ],
                    )
                  ],
                ),
              ),
              NcSpacing.xl(),
              Expanded(
                child: child,
              ),
              NcSpacing.xl(),
            ],
          );
        });
      },
      child: child,
    );
  }
}

const Color _kKeyUmbraOpacity = Color(0x33000000); // alpha = 0.2
const Color _kKeyPenumbraOpacity = Color(0x24000000); // alpha = 0.14
const Color _kAmbientShadowOpacity = Color(0x1F000000); // alpha = 0.12