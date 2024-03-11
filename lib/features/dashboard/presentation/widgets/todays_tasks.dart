import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/shared.dart';

/// Today's tasks section of the dashboard.
class DashboardTodaysTasks extends StatefulWidget {
  /// Today's tasks section of the dashboard.
  const DashboardTodaysTasks({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DashboardTodaysTasksState();
}

class _DashboardTodaysTasksState extends State<DashboardTodaysTasks> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      var modules = ref.watch(modulesProvider);

      var deadlines = ref.watch(planProvider).deadlines;

      var todaysTasks = modules.keys
          .where((module) =>
              deadlines.containsKey(module) && deadlines[module]!.end.isToday)
          .toList();

      return LpContainer(
        title: t.dashboard_todaysTasks_title,
        child: ConditionalWidget(
          condition: todaysTasks.isNotEmpty,
          ifTrue: ListView(
            children: [
              for (var module in todaysTasks) ...[
                ModuleWidget.checkmark(moduleId: module),
                Spacing.small(),
              ]
            ],
          ),
          ifFalse: Center(
            child: NcBodyText(t.dashboard_todaysTasks_noTasks),
          ),
        ),
      );
    });
  }
}
