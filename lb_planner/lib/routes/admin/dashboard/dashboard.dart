part of lbplanner_routes;

/// The admin route.
class AdminDashboardRoute extends StatelessWidget {
  /// The admin route.
  const AdminDashboardRoute({Key? key}) : super(key: key);

  /// Info about this route.
  static final info = RouteInfo(routeName: "/admin/dashboard", builder: (_, __) => AdminDashboardRoute(), titleGenerator: (t) => t.admin_dashboard_routeName);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Wrap(
        spacing: NcSpacing.mediumSpacing,
        runSpacing: NcSpacing.mediumSpacing,
        children: [
          AdminDashboardSection(
            route: AdminFeedbackRoute.info,
            svg: svg_admin_dashboard_feedbackCover,
            icon: Icons.chat_bubble,
          ),
        ],
      ),
    );
  }
}
