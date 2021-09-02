import 'package:desktop/widgets/views/courses_overview/course_overview_item.dart';
import 'package:desktop/widgets/views/courses_overview/module.dart';
import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

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
          ? Column(
              children: [
                Container(
                  height: CourseOverview.labelHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(ncRadius),
                    color: NcThemes.current.primaryColor,
                    boxShadow: ncShadow,
                  ),
                  padding: EdgeInsets.all(NcContainer.padding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      NcTag(
                        text: "D",
                        backgroundColor: Colors.purple,
                        fontSize: CourseOverview.labelFontSize,
                        height: double.infinity,
                      ),
                      NcCaptionText(
                        "Name",
                        fontSize: CourseOverview.labelFontSize,
                      ),
                      NcCaptionText(
                        "Deadline",
                        fontSize: CourseOverview.labelFontSize,
                      ),
                      NcCaptionText(
                        "Planned",
                        fontSize: CourseOverview.labelFontSize,
                      ),
                      NcCaptionText(
                        "Grade",
                        fontSize: CourseOverview.labelFontSize,
                      ),
                      NcCaptionText(
                        "Grade",
                        fontSize: CourseOverview.labelFontSize,
                      ),
                    ],
                  ),
                ),
                NcSpacing.large(),
                Expanded(
                  child: NcContainer(
                    label: NcDropdown(
                      items: ["doggirl", "catgirl", "bunnygirl"],
                      value: 0,
                    ),
                    body: ListView(
                      children: [
                        CourseOverviewModuleItem(id: 0),
                        CourseOverviewModuleItem(id: 0),
                        CourseOverviewModuleItem(id: 0),
                        CourseOverviewModuleItem(id: 0),
                        CourseOverviewModuleItem(id: 0),
                        CourseOverviewModuleItem(id: 0),
                        CourseOverviewModuleItem(id: 0),
                        CourseOverviewModuleItem(id: 0),
                        CourseOverviewModuleItem(id: 0),
                        CourseOverviewModuleItem(id: 0),
                        CourseOverviewModuleItem(id: 0),
                        CourseOverviewModuleItem(id: 0),
                        CourseOverviewModuleItem(id: 0),
                        CourseOverviewModuleItem(id: 0),
                        CourseOverviewModuleItem(id: 0),
                        CourseOverviewModuleItem(id: 0),
                        CourseOverviewModuleItem(id: 0),
                        CourseOverviewModuleItem(id: 0),
                        CourseOverviewModuleItem(id: 0),
                        CourseOverviewModuleItem(id: 0),
                        CourseOverviewModuleItem(id: 0),
                        CourseOverviewModuleItem(id: 0),
                        CourseOverviewModuleItem(id: 0, bottom: true),
                      ],
                    ),
                    contentPadding: false,
                  ),
                )
              ],
            )
          : NcGridView(
              spacing: NcSpacing.mediumSpacing,
              alignment: Alignment.topLeft,
              children: [
                CourseOverviewItem(
                  id: 0,
                  onShowDetails: highlightCourse,
                )
              ],
            ),
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
