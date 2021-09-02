import 'package:desktop/widgets/views/courses_overview/course_stats/course_stats_bar.dart';
import 'package:flutter/material.dart';
import 'package:lb_planner/data.dart';
import 'package:lb_planner/ui.dart';
import 'package:lb_planner/ui/widgets/spacing.dart';
import 'dart:math';

class CourseStatsChart extends StatelessWidget {
  const CourseStatsChart({Key? key, required this.stats, this.height}) : super(key: key);

  final double? height;
  final StatusProfile stats;
  static double get adjustValue => NcSpacing.smallSpacing + (NcBodyText.baseStyle.height ?? 19); // dont ask flutter wants it so

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      alignment: Alignment.bottomCenter,
      child: LayoutBuilder(
        builder: (context, size) {
          double height = size.maxHeight - adjustValue;

          List<int> values = [stats.done, stats.uploaded, stats.late, stats.pending];

          var max = values.reduce((curr, next) => curr > next ? curr : next);

          double doneP = stats.done > 0 ? stats.done / max : 0;
          double uploadedP = stats.uploaded > 0 ? stats.uploaded / max : 0;
          double lateP = stats.late > 0 ? stats.late / max : 0;
          double pendingP = stats.pending > 0 ? stats.pending / max : 0;

          double doneHeight = height * doneP;
          double uploadedHeight = height * uploadedP;
          double lateHeight = height * lateP;
          double pendingHeight = height * pendingP;

          return Row(
            children: [
              // Dont touch it
              CourseStatsBar(height: doneHeight, label: stats.done.toString(), color: NcThemes.current.doneColor),
              NcSpacing.small(),
              CourseStatsBar(height: uploadedHeight, label: stats.uploaded.toString(), color: NcThemes.current.uploadedColor),
              NcSpacing.small(),
              CourseStatsBar(height: lateHeight, label: stats.late.toString(), color: NcThemes.current.lateColor),
              NcSpacing.small(),
              CourseStatsBar(height: pendingHeight, label: stats.pending.toString(), color: NcThemes.current.pendingColor),
            ],
          );
        },
      ),
    );
  }
}
