import 'package:flutter/material.dart';
import 'package:lb_planner/data.dart';
import 'package:lb_planner/ui.dart';

class StatusOverviewBar extends StatelessWidget {
  const StatusOverviewBar({Key? key, required this.status, required this.width}) : super(key: key);

  final ModuleStatus status;
  final double width;

  static const double height = 10;

  @override
  Widget build(BuildContext context) {
    Color color;

    switch (status) {
      case ModuleStatus.Done:
        color = NcThemes.current.doneColor;
        break;
      case ModuleStatus.Uploaded:
        color = NcThemes.current.uploadedColor;
        break;
      case ModuleStatus.Late:
        color = NcThemes.current.lateColor;
        break;
      case ModuleStatus.Pending:
        color = NcThemes.current.pendingColor;
        break;
      default:
        color = Colors.black;
    }

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(color: color),
    );
  }
}
