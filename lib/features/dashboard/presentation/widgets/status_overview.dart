import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/shared.dart';
import 'widgets.dart';

/// Status overview of the dashboard route.
class DashboardStatusOverview extends StatefulWidget {
  /// Status overview of the dashboard route.
  const DashboardStatusOverview({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DashboardStatusOverviewState();
}

class _DashboardStatusOverviewState extends State<DashboardStatusOverview> {
  @override
  Widget build(context) {
    return Consumer(builder: (context, ref, _) {
      var stats = ref.watch(statisticsProvider);

      return LpContainer(
        title: t.dashboard_statusOverview_title,
        trailing: Row(
          children: [
            DashboardStatusOverviewBarLabel(
                color: successColor, count: stats.completedModules),
            Spacing.small(),
            DashboardStatusOverviewBarLabel(
                color: warningColor, count: stats.uploadedModules),
            Spacing.small(),
            DashboardStatusOverviewBarLabel(
                color: errorColor, count: stats.lateModules),
            Spacing.small(),
            DashboardStatusOverviewBarLabel(
                color: neutralColor, count: stats.pendingModules),
          ],
        ),
        child: DashboardStatusOverviewChart(),
      );
    });
  }
}
