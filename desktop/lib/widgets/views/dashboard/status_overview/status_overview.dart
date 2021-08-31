import 'package:desktop/widgets/views/dashboard/status_overview/bar.dart';
import 'package:flutter/material.dart';
import 'package:lb_planner/data.dart';
import 'package:lb_planner/data/enums/enums.dart';
import 'package:lb_planner/ui.dart';

class StatusOverview extends StatelessWidget {
  const StatusOverview({Key? key, required this.stats}) : super(key: key);

  final StatusProfile stats;

  static const double maxHeight = 15;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, size) {
        bool done;
        bool uploaded;
        bool late;
        bool pending;

        int spacing = 0;

        if (done = stats.done > 0) spacing++;
        if (uploaded = stats.uploaded > 0) spacing++;
        if (late = stats.late > 0) spacing++;
        if (pending = stats.pending > 0) spacing++;

        // print(done);

        spacing--;

        double width = size.maxWidth - NcSpacing.smallSpacing * spacing;

        double doneWidth = width * stats.donePercentage;
        double uploadedWidth = width * stats.uploadedPercentage;
        double lateWidth = width * stats.latePercentage;
        double pendingWidth = width * stats.pendingPercentage;

        return Row(
          children: [
            if (done) StatusOverviewBar(status: ModuleStatus.Done, width: doneWidth, height: maxHeight),
            if (done) NcSpacing.small(),
            if (uploaded) StatusOverviewBar(status: ModuleStatus.Uploaded, width: uploadedWidth, height: maxHeight),
            if (uploaded) NcSpacing.small(),
            if (late) StatusOverviewBar(status: ModuleStatus.Late, width: lateWidth, height: maxHeight),
            if (late) NcSpacing.small(),
            if (pending) StatusOverviewBar(status: ModuleStatus.Pending, width: pendingWidth, height: maxHeight),
          ],
        );
      },
    );
  }
}
