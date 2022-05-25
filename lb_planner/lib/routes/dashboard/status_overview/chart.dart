part of lbplanner_routes;

/// Chart for [DashboardStatusOverview].
class DashboardStatusOverviewChart extends StatelessWidget {
  /// Chart for [DashboardStatusOverview].
  const DashboardStatusOverviewChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: DashboardStatusOverviewBar.height),
      child: LayoutBuilder(
        builder: (context, constraints) => Consumer(
          builder: (context, ref, _) {
            var stats = ref.watch(statisticsProvider);

            var width = constraints.maxWidth;

            var doneWidth = width * stats.completedModules / stats.totalModules;

            var uploadedWidth = width * stats.uploadedModules / stats.totalModules;

            var lateWidth = width * stats.lateModules / stats.totalModules;

            var pendingWidth = width * stats.pendingModules / stats.totalModules;

            /// Determin where spacing is needed.

            var isDoneLast = stats.completedModules == stats.totalModules && doneWidth.isSafeValue;

            var isUploadedLast = (stats.uploadedModules + stats.completedModules) == stats.totalModules && uploadedWidth.isSafeValue;

            var isLateLast = (stats.lateModules + stats.uploadedModules + stats.completedModules) == stats.totalModules && lateWidth.isSafeValue;

            var shouldDoneSpace = !isDoneLast && doneWidth > 0;

            var shouldUploadSpace = !isUploadedLast && uploadedWidth > 0;

            var shouldLateSpace = !isLateLast && lateWidth > 0;

            print("late: $lateWidth");

            return ConditionalWidget(
              condition: stats.totalModules > 0,
              trueWidget: (context) => Row(
                children: [
                  DashboardStatusOverviewBar(width: shouldDoneSpace ? doneWidth.withSpacing.safeValue : doneWidth.safeValue, color: successColor),
                  if (shouldDoneSpace) NcSpacing.small(),
                  DashboardStatusOverviewBar(width: shouldUploadSpace ? uploadedWidth.withSpacing.safeValue : uploadedWidth.safeValue, color: warningColor),
                  if (shouldUploadSpace) NcSpacing.small(),
                  DashboardStatusOverviewBar(width: shouldLateSpace ? lateWidth.withSpacing.safeValue : lateWidth.safeValue, color: errorColor),
                  if (shouldLateSpace) NcSpacing.small(),
                  DashboardStatusOverviewBar(width: pendingWidth.safeValue, color: neutralColor),
                ],
              ),
              falseWidget: (context) => Center(
                child: NcBodyText(context.t.dashboard_statusOverview_noData),
              ),
            );
            // return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

extension on double {
  double get safeValue {
    return !isSafeValue ? 0 : this;
  }

  bool get isSafeValue => !isNaN && !isNegative;

  double get withSpacing {
    return this - NcSpacing.smallSpacing;
  }
}
