import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:lb_planner/ui.dart';
import 'package:lb_planner/data.dart';

class ModuleItem extends StatelessWidget {
  ModuleItem({
    Key? key,
    required this.id,
  }) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      width: 300,
      height: 50,
      decoration: BoxDecoration(
        color: NcThemes.current.primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Hallo',
            style: NcBodyText.baseStyle,
          ),
          // Container(
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
    );
  }
}
