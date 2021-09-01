import 'package:desktop/widgets/views/courses_overview/svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:lb_planner/data.dart';
import 'package:lb_planner/ui.dart';

import 'course_overview_charts.dart';

class CourseOverviewItem extends StatelessWidget {
  const CourseOverviewItem({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  Widget build(BuildContext context) {
    return NcContainer(
      label: NcTitleText("Deutsch"),
      // TODO: NcTitleText(DB.courses[id]!.name),
      body: Row(
        children: [
          Column(
            children: [
              Row(
                children: [
                  NcTag(
                    text: "D",
                    //TODO:text: DB.courses[id]!.tag,
                    backgroundColor: Colors.purple,
                    // TODO: Farbe von Datenbank ziehen
                  ),
                  NcSpacing.small(),
                  NcTag(
                    text: "Grade: 4",
                    // text: DB.courses[id]!.getAverageGrade().toString(),
                    backgroundColor: Colors.purple,
                    // TODO: Farbe von Datenbank ziehen
                  ),
                ],
              ),
              Wrap(
                children: [
                  if (DB.courses[id]!.tags.contains(CourseTags.Completed)) NcTag(text: "Completed", backgroundColor: Colors.cyan),
                ],
              ),
              Row(
                children: [
                  //TODO: if (DB.courses[id]!.tags.contains(CourseTags.Done))
                  NcTag(text: "Done", backgroundColor: NcThemes.current.doneColor),
                  //TODO: if (DB.courses[id]!.tags.contains(CourseTags.Uploaded))
                  NcTag(text: "Uploaded", backgroundColor: NcThemes.current.uploadedColor),
                  //TODO: if (DB.courses[id]!.tags.contains(CourseTags.Late))
                  NcTag(text: "Late", backgroundColor: NcThemes.current.lateColor),
                  //TODO: if (DB.courses[id]!.tags.contains(CourseTags.Pending))
                  NcTag(text: "Pending", backgroundColor: NcThemes.current.pendingColor),
                ],
              )
            ],
          ),
          Expanded(
            child: DB.courses[id]!.tags.contains(CourseTags.Completed) ? NcVectorImage(code: you_are_done_svg) : CourseOverviewCharts(),
          )
        ],
      ),
    );
  }
}
