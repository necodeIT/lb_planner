import 'package:desktop/widgets/views/calendar/modules/course_modules.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:lb_planner/ui.dart';
import 'package:lb_planner/data.dart';

import '../calendar_day.dart';
import 'modules.dart';

class ModuleGrid extends StatelessWidget {
  ModuleGrid({
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RotatedBox(
          quarterTurns: -1,
          child: Row(
            //mainAxisAlignment:
            children: [
              Expanded(child: NcTitleText('May', textAlign: TextAlign.center, fontSize: 20)),
              Expanded(child: NcTitleText('May', textAlign: TextAlign.center, fontSize: 20)),
              Expanded(child: NcTitleText('May', textAlign: TextAlign.center, fontSize: 20)),
              Expanded(child: NcTitleText('May', textAlign: TextAlign.center, fontSize: 20)),
              Expanded(child: NcTitleText('May', textAlign: TextAlign.center, fontSize: 20)),
              SizedBox(width: CourseModules.tagHeight)
            ],
          ),
        ),
        NcSpacing.xs(),
        CourseModules(id: 0),
        CourseModules(id: 0),
        CourseModules(id: 0),
        CourseModules(id: 0),
        CourseModules(id: 0),
        CourseModules(id: 0),
        CourseModules(id: 0),
      ],
    );
  }
}
