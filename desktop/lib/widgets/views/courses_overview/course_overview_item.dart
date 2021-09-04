import 'package:desktop/dialogs/edit_course_dialog.dart';
import 'package:desktop/widgets/views/courses_overview/course_stats/course_stats_chart.dart';
import 'package:desktop/widgets/views/dashboard/svg/catgirl.dart';
import 'package:desktop/widgets/views/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:lb_planner/data.dart';
import 'package:lb_planner/ui.dart';

class CourseOverviewItem extends StatelessWidget {
  const CourseOverviewItem({Key? key, required this.id, required this.onShowDetails}) : super(key: key);

  final int id;
  final Function(int) onShowDetails;

  @override
  Widget build(BuildContext context) {
    // var stats = DB.courses[id]!.getStats();
    var stats = StatusProfile(done: 15, late: 10, uploaded: 5, pending: 20);

    return GestureDetector(
      onTap: () => onShowDetails(id),
      child: NcContainer(
        width: 450,
        height: 250,
        label: NcCaptionText(
          "Deutsch",
          fontSize: 20,
        ),
        trailingIcon: GestureDetector(
          onTap: () => showEditCourseDialog(context, id),
          child: Icon(
            Icons.more_horiz,
            color: NcThemes.current.textColor,
          ),
        ),
        // TODO: NcTitleText(DB.courses[id]!.name),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                NcSpacing.small(),
                // if (DB.courses[id]!.tags.contains(CourseTags.Completed)) NcTag(text: "Completed", backgroundColor: Colors.cyan),
                Row(
                  children: [
                    NcTag(text: "Done", backgroundColor: NcThemes.current.doneColor),
                    NcSpacing.small(),
                    //TODO: if (DB.courses[id]!.tags.contains(CourseTags.Uploaded))
                    NcTag(text: "Uploaded", backgroundColor: NcThemes.current.uploadedColor),
                    NcSpacing.small(),
                    NcTag(text: "Late", backgroundColor: NcThemes.current.lateColor),
                    NcSpacing.small(),
                    //TODO: if (DB.courses[id]!.tags.contains(CourseTags.Pending))
                    NcTag(text: "Pending", backgroundColor: NcThemes.current.pendingColor)
                    //TODO: if (DB.courses[id]!.tags.contains(CourseTags.Late))
                  ],
                ),
                // NcSpacing.small(),
                // Row(
                //   children: [
                //     ,
                //   ],
                // )
              ],
            ),
            // TODO: child: DB.courses[id]!.tags.contains(CourseTags.Completed) ? NcVectorImage(code: you_are_done_svg) : CourseOverviewCharts(),
            CourseStatsChart(stats: stats)
          ],
        ),

        // body: NcBodyText("test"),
      ),
    );
    // return NcButton(text: "sdasd", onTap: () {});
  }
}
