import 'package:flutter/material.dart';
import 'package:lb_planner/data.dart';
import 'package:lb_planner/ui.dart';

class CourseStatsBar extends StatelessWidget {
  const CourseStatsBar({Key? key, required this.height, required this.label, required this.color}) : super(key: key);

  final double height;
  final String label;
  final Color color;

  static const double width = 10;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        NcBodyText(label),
        if (height > 0) NcSpacing.small(),
        Container(
          height: height,
          width: width,
          decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(ncRadius)),
        )
      ],
    );
  }
}
