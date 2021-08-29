import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

class Dashboard_TodaysTasksItem extends StatelessWidget {
  Dashboard_TodaysTasksItem({
    Key? key,
    this.id,
  }) : super(key: key) {}

  final int? id;

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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NcTag(
            text: 'AM',
            backgroundColor: NcThemes.current.accentColor,
            //width: 40,
          ),
          Text(
            'Hallo',
            style: NcBodyText.baseStyle,
          ),
          NcCheckBox(
            interactable: false,
            radius: 8,
            onChanged: (_) {},
            width: 25,
            height: 25,
            iconSize: 25,
          )
        ],
      ),
    );
  }
}
