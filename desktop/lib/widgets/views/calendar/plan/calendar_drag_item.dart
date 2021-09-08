import 'package:desktop/widgets/views/calendar/plan/calendar_item.dart';
import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

class CalendarDragItem extends StatelessWidget {
  CalendarDragItem({Key? key, required this.id, this.height = 35})
      : super(key: key);

  final int id;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Draggable<int>(
      data: id,
      childWhenDragging: Container(),
      feedback: Material(
        child: CalendarItem(
          id: id,
        ),
      ),
      child: Container(
        margin: EdgeInsets.only(bottom: NcSpacing.xsSpacing),
        padding: const EdgeInsets.only(left: ncRadius, right: ncRadius),
        //width: 300,
        height: height,
        decoration: BoxDecoration(
          color: NcThemes.current.secondaryColor,
          borderRadius: BorderRadius.circular(ncRadius),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NcTag(
              fontSize: 17,
              height: 27,
              text: 'AM',
              // TODO: text: DB.courses[DB.modules[id]!.course]!.tag,
              backgroundColor: NcThemes.current.accentColor,
              //width: 40,
            ),
            Text(
              'Hallo',
              style: NcBodyText.baseStyle,
            ),
            // TODO: Container(
            //     width: 23,
            //     height: 23,
            //     decoration: BoxDecoration(
            //         border: DB.modules[id]!.status == ModuleStatus.Done
            //             ? Border.all(
            //                 color: NcThemes.current.pendingColor, width: 3)
            //             : Border.all(color: Colors.transparent, width: 0),
            //         borderRadius: BorderRadius.circular(9),
            //         color: DB.modules[id]!.status == ModuleStatus.Done
            //             ? NcThemes.current.doneColor
            //             : DB.modules[id]!.status == ModuleStatus.Uploaded
            //                 ? NcThemes.current.uploadedColor
            //                 : DB.modules[id]!.status == ModuleStatus.Late
            //                     ? NcThemes.current.lateColor
            //                     : Colors.transparent),
            //     child: DB.modules[id]!.status == ModuleStatus.Done
            //         ? Icon(
            //             FontAwesome5Solid.check,
            //             color: NcThemes.current.buttonTextColor,
            //             size: 15,
            //           )
            //         : DB.modules[id]!.status == ModuleStatus.Uploaded
            //             ? Icon(
            //                 FontAwesome5Solid.minus,
            //                 color: NcThemes.current.buttonTextColor,
            //                 size: 15,
            //               )
            //             : DB.modules[id]!.status == ModuleStatus.Late
            //                 ? Icon(
            //                     FontAwesome5Solid.exclamation,
            //                     color: NcThemes.current.buttonTextColor,
            //                     size: 15,
            //                   )
            //                 : Icon(
            //                     Icons.ac_unit,
            //                     color: Colors.transparent,
            //                     size: 10,
            //                   )),
          ],
        ),
      ),
    );
  }
}
