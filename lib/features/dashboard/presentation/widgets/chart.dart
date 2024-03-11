import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/shared.dart';
import 'widgets.dart';

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

            var doneP = stats.completedModules / stats.totalModules;

            var uploadedP = stats.uploadedModules / stats.totalModules;

            var lateP = stats.lateModules / stats.totalModules;

            var pendingP = stats.pendingModules / stats.totalModules;

            /// Determin where spacing is needed.

            var isDoneLast =
                stats.completedModules == stats.totalModules && doneP > 0;

            var isUploadedLast =
                (stats.uploadedModules + stats.completedModules) ==
                        stats.totalModules &&
                    uploadedP > 0;

            var isLateLast = (stats.lateModules +
                        stats.uploadedModules +
                        stats.completedModules) ==
                    stats.totalModules &&
                lateP > 0;

            var shouldDoneSpace = !isDoneLast && doneP > 0;

            var shouldUploadSpace = !isUploadedLast && uploadedP > 0;

            var shouldLateSpace = !isLateLast && lateP > 0;

            var spacers = 0;

            if (shouldDoneSpace) spacers++;

            if (shouldUploadSpace) spacers++;

            if (shouldLateSpace) spacers++;

            width -= spacers * Spacing.smallSpacing;

            var doneWidth = width * doneP;

            var uploadedWidth = width * uploadedP;

            var lateWidth = width * lateP;

            var pendingWidth = width * pendingP;

            return ConditionalWidget(
              condition: stats.totalModules > 0,
              ifTrue: Row(
                children: [
                  DashboardStatusOverviewBar(
                      width: doneWidth.safeValue, color: successColor),
                  if (shouldDoneSpace) Spacing.small(),
                  DashboardStatusOverviewBar(
                      width: uploadedWidth.safeValue, color: warningColor),
                  if (shouldUploadSpace) Spacing.small(),
                  DashboardStatusOverviewBar(
                      width: lateWidth.safeValue, color: errorColor),
                  if (shouldLateSpace) Spacing.small(),
                  DashboardStatusOverviewBar(
                      width: pendingWidth.safeValue, color: neutralColor),
                ],
              ),
              ifFalse: Center(
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
}
