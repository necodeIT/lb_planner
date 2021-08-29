import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:lb_planner/ui.dart';
import 'package:lb_planner/data.dart';

class SettingsCourses extends StatelessWidget {
  SettingsCourses({
    Key? key,
    required this.id,
  }) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      width: 400,
      height: 50,
      decoration: BoxDecoration(
        color: NcThemes.current.primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          NcCheckBox(
            interactable: true,
            radius: 8,
            onChanged: (_) {},
            width: 25,
            height: 25,
            iconSize: 25,
          ),
          Container(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NcTag(
                    fontSize: 17,
                    height: 27,
                    text: 'AM',
                    //text: DB.courses[DB.modules[id]!.course]!.tag,
                    backgroundColor: NcThemes.current.accentColor,
                    //width: 40,
                  ),
                  NcBodyText(
                    //DB.modules[id]!.name,
                    'Hallo',
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                      FontAwesome5Solid.ellipsis_h,
                      color: NcThemes.current.buttonTextColor,
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
