part of lbplanner_routes;

/// Status overview of the dashboard route.
class DashboardStatusOverview extends LocalizedWidget {
  /// Status overview of the dashboard route.
  const DashboardStatusOverview({Key? key}) : super(key: key);

  @override
  Widget create(context, t) {
    return Consumer(builder: (context, ref, _) {
      var stats = ref.watch(statisticsProvider);

      return LpContainer(
        title: t.dashboard_statusOverview,
        trailing: Row(
          children: [
            DashboardStatusOverviewBarLabel(color: successColor, count: stats.completedModules),
            NcSpacing.xs(),
            DashboardStatusOverviewBarLabel(color: warningColor, count: stats.uploadedModules),
            NcSpacing.xs(),
            DashboardStatusOverviewBarLabel(color: errorColor, count: stats.lateModules),
            NcSpacing.xs(),
            DashboardStatusOverviewBarLabel(color: neutralColor, count: stats.pendingModules),
          ],
        ),
        child: DashboardStatusOverviewChart(),
      );
    });
  }
}
