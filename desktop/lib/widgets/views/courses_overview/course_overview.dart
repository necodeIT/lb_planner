import 'package:desktop/widgets/views/courses_overview/course_overview_item.dart';
import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

class CourseOverview extends StatelessWidget {
  const CourseOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return View(
      title: "Course Overview",
      content: NcGridView(
        spacing: NcSpacing.mediumSpacing,
        alignment: Alignment.topLeft,
        // margin: EdgeInsets.only(left: 0),
        children: [
          CourseOverviewItem(id: 0),
          CourseOverviewItem(id: 0),
          CourseOverviewItem(id: 0),
          CourseOverviewItem(id: 0),
          CourseOverviewItem(id: 0),
          CourseOverviewItem(id: 0),
          CourseOverviewItem(id: 0),
          CourseOverviewItem(id: 0),
          CourseOverviewItem(id: 0),
          CourseOverviewItem(id: 0),
          CourseOverviewItem(id: 0),
          CourseOverviewItem(id: 0),
          CourseOverviewItem(id: 0),
          CourseOverviewItem(id: 0),
        ],
      ),
    );
  }
}
