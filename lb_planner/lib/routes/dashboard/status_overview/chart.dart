part of lbplanner_routes;

/// Chart for [DashboardStatusOverview].
class DashboardStatusOverviewChart extends StatelessWidget {
  /// Chart for [DashboardStatusOverview].
  const DashboardStatusOverviewChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Consumer(
        builder: (context, ref, _) {
          var stats = ref.watch(statisticsProvider);

          stats = stats.copyWith(
            completedModules: 10,
            uploadedModules: 5,
            lateModules: 2,
            pendingModules: 1,
          );

          var spacing = 0;

          var width = constraints.maxWidth;

          var doneWidth = width * stats.completedModules / stats.totalModules;

          var uploadedWidth = width * stats.uploadedModules / stats.totalModules;

          var lateWidth = width * stats.lateModules / stats.totalModules;

          var pendingWidth = width * stats.pendingModules / stats.totalModules;

          // return Row(
          //   children: [
          //     DashboardStatusOverviewBar(width: doneWidth, color: successColor),
          //     NcSpacing.xs(),
          //     DashboardStatusOverviewBar(width: uploadedWidth, color: warningColor),
          //     NcSpacing.xs(),
          //     DashboardStatusOverviewBar(width: lateWidth, color: errorColor),
          //     NcSpacing.xs(),
          //     DashboardStatusOverviewBar(width: pendingWidth, color: neutralColor),
          //   ],
          // );
          return SizedBox.shrink();
        },
      ),
    );
  }
}
