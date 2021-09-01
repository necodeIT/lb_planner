import 'package:flutter/material.dart';
import 'package:lb_planner/data/db.dart';
import 'package:lb_planner/ui.dart';
import 'course_selection_item.dart';

class CourseSelection extends StatefulWidget {
  CourseSelection({Key? key, this.height, this.width, this.bottomButton}) : super(key: key);

  final double? height;
  final double? width;
  final Widget? bottomButton;

  @override
  _CourseSelectionState createState() => _CourseSelectionState();
}

class _CourseSelectionState extends State<CourseSelection> {
  @override
  Widget build(BuildContext context) {
    return NcContainer(
      height: widget.height,
      width: widget.width,
      label: NcInputField(
        placeholder: "Search",
        prefixIcon: Icon(
          Icons.search,
          color: NcThemes.current.textColor,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                NcSpacing.small(),
                // TODO: for(int id in DB.courses.keys) CourseSelectionItem(id: id, margin: id == DB.courses.keys.last),

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
                CourseSelectionItem(id: 0, margin: false),
              ],
            ),
          ),
          if (widget.bottomButton != null) NcSpacing.small(),
          if (widget.bottomButton != null) widget.bottomButton ?? Container(), // dart stupid
        ],
      ),
    );
  }
}
