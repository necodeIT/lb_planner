part of lbplanner_routes;

/// Today's tasks section of the dashboard.
class DashboardTodaysTasks extends LocalizedWidget {
  /// Today's tasks section of the dashboard.
  const DashboardTodaysTasks({Key? key}) : super(key: key);

  @override
  Widget build(context, t) {
    return Consumer(builder: (context, ref, _) {
      var modules = ref.watch(modulesProvider);

      var deadlines = ref.watch(planProvider).deadlines;

      var todaysTasks = modules.keys.where((module) => deadlines.containsKey(module) && deadlines[module]!.end.isToday).toList();

      return LpContainer(
        title: t.dashboard_todaysTasks_title,
        child: ConditionalWidget(
          condition: todaysTasks.isNotEmpty,
          trueWidget: (_) => ListView(
            children: [
              for (var module in todaysTasks) ...[
                ModuleWidget.checkmark(moduleId: module),
                NcSpacing.small(),
              ]
            ],
          ),
          falseWidget: (_) => Center(
            child: NcBodyText(t.dashboard_todaysTasks_noTasks),
          ),
        ),
      );
    });
  }
}
