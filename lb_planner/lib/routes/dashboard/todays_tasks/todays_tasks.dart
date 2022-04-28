part of lbplanner_routes;

/// Today's tasks section of the dashboard.
class DashboardTodaysTasks extends LocalizedWidget {
  /// Today's tasks section of the dashboard.
  const DashboardTodaysTasks({Key? key}) : super(key: key);

  @override
  Widget create(context, t) {
    return Consumer(builder: (context, ref, _) {
      var modules = ref.watch(modulesProvider);

      return LpContainer(
        title: t.dashboard_statusOverview_title,
        child: ListView(
          children: [
            for (var module in modules.values) ...[
              DashboardTodaysTasksItem(module: module),
              NcSpacing.small(),
            ]
          ],
        ),
      );
    });
  }
}
