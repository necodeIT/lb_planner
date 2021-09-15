import 'package:desktop/generated/l10n.dart';
import 'package:desktop/widgets/views/courses_overview/course_overview_item.dart';
import 'package:desktop/widgets/views/courses_overview/module.dart';
import 'package:flutter/material.dart';
import 'package:lb_planner/data.dart';
import 'package:lb_planner/ui.dart';

import 'course_highlight.dart';

class CourseOverview extends StatefulWidget {
  const CourseOverview({Key? key}) : super(key: key);

  static const double labelFontSize = 20;
  static const double labelHeight = 60;

  static const gridRoute = "course_overview";
  static const courseHighlightRoute = "course_highlight";

  @override
  _CourseOverviewState createState() => _CourseOverviewState();
}

class _CourseOverviewState extends State<CourseOverview> {
  int highlightID = 0;

  @override
  Widget build(BuildContext context) {
    return NcView(
      routes: [
        NcView.route(
          title: S.of(context).courseOverview_title,
          customRouteName: CourseOverview.gridRoute,
          content: NcGridView.responsive(
            minHeight: CourseOverviewItem.height,
            maxHeight: CourseOverviewItem.height,
            minWidth: CourseOverviewItem.minWidth,
            emptyMessage: "You don't have any courses. Go to settings and select some.",
            children: [for (var id in DB.courses.keys) CourseOverviewItem(id: id, onShowDetails: highlightCourse)],
          ),
        ),
        NcView.route(
          title: S.of(context).courseOverview_title,
          customRouteName: CourseOverview.courseHighlightRoute,
          popRoute: CourseOverview.gridRoute,
          content: CourseHighlight(id: highlightID),
        ),
      ],
    );
  }

  void highlightCourse(int id) {
    highlightID = id;
  }
}
