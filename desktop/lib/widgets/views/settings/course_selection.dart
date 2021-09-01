import 'package:desktop/widgets/views/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';
import 'course_selection_item.dart';

class CourseSelection extends StatefulWidget {
  CourseSelection({Key? key}) : super(key: key);

  @override
  _CourseSelectionState createState() => _CourseSelectionState();
}

class _CourseSelectionState extends State<CourseSelection> {
  @override
  Widget build(BuildContext context) {
    return NcContainer(
      // label: NcCaptionText(
      //   "Courses",
      //   fontSize: Dashboard.titleSize,
      // ),
      label: NcInputField(
        placeholder: "Search",
        prefixIcon: Icon(
          Icons.search,
          color: NcThemes.current.textColor,
        ),
      ),
      body: Column(
        children: [
          // NcInputField(
          //   placeholder: "Search",
          //   prefixIcon: Icon(
          //     Icons.search,
          //     color: NcThemes.current.textColor,
          //   ),
          // ),
          Expanded(
            child: ListView(
              children: [
                NcSpacing.small(),
                CourseSelectionItem(id: 0),
                CourseSelectionItem(id: 0),
                CourseSelectionItem(id: 0),
                CourseSelectionItem(id: 0),
                CourseSelectionItem(id: 0),
                CourseSelectionItem(id: 0),
                CourseSelectionItem(id: 0),
                CourseSelectionItem(id: 0),
                CourseSelectionItem(id: 0),
                CourseSelectionItem(id: 0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
