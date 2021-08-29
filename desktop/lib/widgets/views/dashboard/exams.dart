import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';
import 'package:lb_planner/data.dart';

class DashboardExamItem extends StatelessWidget {
  DashboardExamItem({Key? key, required this.id, this.margin = true}) : super(key: key);

  final int id;
  final bool margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: ncRadius, right: ncRadius),
      margin: EdgeInsets.only(bottom: margin ? NcSpacing.smallSpacing : 0),
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
              'hallo'),
          NcBodyText(
            //DB.modules[id]!.deadline.toString(),
            '22.8',
          ),
        ],
      ),
    );
  }
}
