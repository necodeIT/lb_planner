import 'package:desktop/widgets/views/calendar/calendar_day.dart';
import 'package:desktop/widgets/views/calendar/modules/module_day.dart';
import 'package:desktop/widgets/views/calendar/modules/modules.dart';
import 'package:desktop/widgets/views/calendar/modules/modules_day.dart';
import 'package:desktop/widgets/views/calendar/plan/calendar_drag_item.dart';
import 'package:desktop/widgets/views/calendar/plan/calendar_item.dart';
import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

class ModuleWidget extends StatelessWidget {
  ModuleWidget({
    Key? key,
    required this.id,
  }) : super(key: key);

  final int id;
  static const double heightTag = 30;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            height: heightTag,
            alignment: Alignment.center,
            //width: double.infinity,
            color: Colors.red,
            child: NcCaptionText(
              'SEW',
              fontSize: 20,
              buttonText: true,
            ),
          ),
          Expanded(
            flex: 1,
            child: ModuleDayItem(
              text: 'text',
              children: [
                //CalendarDragItem(id: 01),
                // CalendarDragItem(id: 01),
                // CalendarDragItem(id: 01),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: ModuleDayItem(
              text: 'text',
              children: [
                ModuleItem(id: 01),
                ModuleItem(id: 01),
                ModuleItem(id: 01),
                ModuleItem(id: 01),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: ModuleDayItem(
              text: 'text',
              children: [],
            ),
          ),
          Expanded(
            flex: 1,
            child: ModuleDayItem(
              text: 'text',
              children: [],
            ),
          ),
          Expanded(
            flex: 1,
            child: ModuleDayItem(
              text: 'text',
              children: [],
            ),
          ),
        ],
      ),
    );
  }
}
