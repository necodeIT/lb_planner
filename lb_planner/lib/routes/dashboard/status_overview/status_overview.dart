part of lbplanner_routes;

/// Status overview of the dashboard route.
class DashboardStatusOverview extends LocalizedWidget {
  /// Status overview of the dashboard route.
  const DashboardStatusOverview({Key? key}) : super(key: key);

  @override
  Widget create(context, t) {
    return Consumer(builder: (context, ref, _) {
      var lateModules = 0;
      var modules = 0;
      var uploadedModules = 0;
      var doneModules = 0;
      var pendingModules = 0;

      return LpContainer(
        title: t.dashboard_statusOverview,
        trailing: Row(
          children: [
            DashboardStatusOverviewBarLabel(color: successColor, count: doneModules),
            NcSpacing.xs(),
            DashboardStatusOverviewBarLabel(color: warningColor, count: uploadedModules),
            NcSpacing.xs(),
            DashboardStatusOverviewBarLabel(color: errorColor, count: lateModules),
            NcSpacing.xs(),
            DashboardStatusOverviewBarLabel(color: neutralColor, count: pendingModules),
          ],
        ),
        child: Center(
          child: NcBodyText("Catgirl"),
        ),
      );
    });
  }
}
