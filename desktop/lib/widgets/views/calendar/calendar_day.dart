import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

class CalendarDayItem extends StatelessWidget {
  CalendarDayItem({
    Key? key,
    required this.text,
    required this.children,
    this.isDropArea = true,
    this.onItemDroped,
  });

  final String text;
  final bool isDropArea;
  final List<Widget> children;
  final Function(int)? onItemDroped;

  static const double padding = 5;

  @override
  Widget build(BuildContext context) {
    return DragTarget<int>(
      builder: (context, data, _) => Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: NcThemes.current.tertiaryColor,
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: padding, right: padding, left: padding),
                child: ListView(children: children),
              ),
            ),
            NcCaptionText(
              text,
              fontSize: 20,
              //textAlign: TextAlign.right,
            ),
          ],
        ),
      ),
      onWillAccept: (id) => isDropArea,
      onAccept: onItemDroped,
    );
  }
}
