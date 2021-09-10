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

  @override
  _CourseOverviewState createState() => _CourseOverviewState();
}

class _CourseOverviewState extends State<CourseOverview> {
  int? highlightID;

  get _hasHighlight => highlightID != null;

  @override
  Widget build(BuildContext context) {
    return NcView(
      title: "Course Overview",
      onNavigateBack: _hasHighlight ? showGrid : null,
      content: _hasHighlight
          ? CourseHighlight(id: highlightID ?? 0)
          : Container(
              child: ListView(
                padding: EdgeInsets.all(10),
                children: [
                  Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    children: [
                      CourseOverviewItem(
                          id: 01, onShowDetails: highlightCourse),
                      CourseOverviewItem(
                          id: 01, onShowDetails: highlightCourse),
                      CourseOverviewItem(
                          id: 01, onShowDetails: highlightCourse),
                      CourseOverviewItem(
                          id: 01, onShowDetails: highlightCourse),
                      CourseOverviewItem(
                          id: 01, onShowDetails: highlightCourse),
                      CourseOverviewItem(
                          id: 01, onShowDetails: highlightCourse),
                      CourseOverviewItem(
                          id: 01, onShowDetails: highlightCourse),
                      CourseOverviewItem(
                          id: 01, onShowDetails: highlightCourse),
                      CourseOverviewItem(
                          id: 01, onShowDetails: highlightCourse),
                    ],
                  ),
                ],
              ),
            ),
      // : NcGridView(
      //     spacing: NcSpacing.mediumSpacing,
      //     alignment: Alignment.topLeft,
      //     children: [
      //       // TODO: for (int id in DB.courses.keys) CourseOverviewItem(id: id, onShowDetails: highlightCourse),
      //       CourseOverviewItem(id: 0, onShowDetails: highlightCourse),
      //       CourseOverviewItem(id: 0, onShowDetails: highlightCourse),
      //       CourseOverviewItem(id: 0, onShowDetails: highlightCourse),
      //       CourseOverviewItem(id: 0, onShowDetails: highlightCourse),
      //       CourseOverviewItem(id: 0, onShowDetails: highlightCourse),
      //       CourseOverviewItem(id: 0, onShowDetails: highlightCourse),
      //       CourseOverviewItem(id: 0, onShowDetails: highlightCourse),
      //       CourseOverviewItem(id: 0, onShowDetails: highlightCourse),
      //       CourseOverviewItem(id: 0, onShowDetails: highlightCourse),
      //       CourseOverviewItem(id: 0, onShowDetails: highlightCourse),
      //       CourseOverviewItem(id: 0, onShowDetails: highlightCourse),
      //       CourseOverviewItem(id: 0, onShowDetails: highlightCourse),
      //       CourseOverviewItem(id: 0, onShowDetails: highlightCourse),
      //       CourseOverviewItem(id: 0, onShowDetails: highlightCourse),
      //       CourseOverviewItem(id: 0, onShowDetails: highlightCourse),
      //       CourseOverviewItem(id: 0, onShowDetails: highlightCourse),
      //       CourseOverviewItem(id: 0, onShowDetails: highlightCourse),
      //       CourseOverviewItem(id: 0, onShowDetails: highlightCourse),
      //       CourseOverviewItem(id: 0, onShowDetails: highlightCourse),
      //     ],
      //   ),
    );
  }

  void highlightCourse(int id) {
    setState(() {
      highlightID = id;
    });
  }

  void showGrid() {
    setState(() {
      highlightID = null;
    });
  }
}
