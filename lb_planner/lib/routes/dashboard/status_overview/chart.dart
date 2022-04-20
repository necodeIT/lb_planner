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

            var doneWidth = (width * stats.completedModules / stats.totalModules).withSpacing;

            var uploadedWidth = (width * stats.uploadedModules / stats.totalModules).withSpacing;

            var lateWidth = (width * stats.lateModules / stats.totalModules).withSpacing;

            var pendingWidth = width * stats.pendingModules / stats.totalModules;

            return ConditionalWidget(
              condition: stats.totalModules > 0,
              trueWidget: (context) => Row(
                children: [
                  DashboardStatusOverviewBar(width: doneWidth.safeValue, color: successColor),
                  if (doneWidth.isSafeValue) NcSpacing.small(),
                  DashboardStatusOverviewBar(width: uploadedWidth.safeValue, color: warningColor),
                  if (uploadedWidth.isSafeValue) NcSpacing.small(),
                  DashboardStatusOverviewBar(width: lateWidth.safeValue, color: errorColor),
                  if (lateWidth.isSafeValue) NcSpacing.small(),
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
