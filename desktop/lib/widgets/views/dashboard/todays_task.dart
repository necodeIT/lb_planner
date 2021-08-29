import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:lb_planner/ui.dart';
import 'package:lb_planner/data.dart';

class DashboardTodaysTasksItem extends StatelessWidget {
  DashboardTodaysTasksItem({
    Key? key,
    required this.id,
  }) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      margin: EdgeInsets.only(bottom: NcSpacing.smallSpacing),
      width: 400,
      height: 50,
      decoration: BoxDecoration(
        color: NcThemes.current.secondaryColor,
        borderRadius: BorderRadius.circular(ncRadius),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NcTag(
            fontSize: 20,
            height: 32,
            text: 'AM',
            //text: DB.courses[DB.modules[id]!.course]!.tag,
            backgroundColor: NcThemes.current.accentColor,
            //width: 40,
          ),
          NcBodyText(
            //DB.modules[id]!.name,
            'Hallo',
          ),
          NcCheckBox(
            interactable: false,
            radius: 8,
            onChanged: (_) {},
            width: 25,
            height: 25,
            iconSize: 25,
          ),
        ],
      ),
    );
  }
}
