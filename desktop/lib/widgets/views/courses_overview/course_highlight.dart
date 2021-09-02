import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:lb_planner/data.dart';
import 'package:lb_planner/ui.dart';

import 'course_overview.dart';
import 'module.dart';

class CourseHighlight extends StatefulWidget {
  const CourseHighlight({
    Key? key,
    required this.id,
  }) : super(key: key);

  final int id;

  @override
  _CourseHighlightState createState() => _CourseHighlightState();
}

class _CourseHighlightState extends State<CourseHighlight> {
  var filter = CourseOverviewMoulesFilter.All;

  @override
  Widget build(BuildContext context) {
    return Column(
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
            children: [
              NcTag(
                text: "D", // TODO: DB.courses[widget.id].tag
                backgroundColor: Colors.purple, // TODO: get color from db
                fontSize: CourseOverview.labelFontSize,
                height: double.infinity,
              ),
              Expanded(
                flex: 8,
                child: NcCaptionText(
                  'Name',
                  fontSize: CourseOverview.labelFontSize,
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  child: Center(
                    child: NcCaptionText(
                      'Deadline',
                      fontSize: CourseOverview.labelFontSize,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  child: Center(
                    child: NcCaptionText(
                      'Planned',
                      fontSize: CourseOverview.labelFontSize,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: NcCaptionText(
                  'Grade',
                  fontSize: CourseOverview.labelFontSize,
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                flex: 2,
                child: NcCaptionText(
                  'Link',
                  fontSize: CourseOverview.labelFontSize,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        NcSpacing.large(),
        Expanded(
          child: NcContainer(
            label: NcDropdown(
              items: EnumToString.toList(CourseOverviewMoulesFilter.values),
              value: 0,
              onValueChanged: (index) {
                setState(() {
                  filter = CourseOverviewMoulesFilter.values[index];
                });
              },
            ),
            body: ListView(
              children: [
                // TODO: for(int id in DB.courses[widget.id]!.modules) CourseOverviewModuleItem(id: id, bottom: id == DB.courses[widget.id]!.modules.last),
                // TODO: Apply filter
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
    );
  }
}

enum CourseOverviewMoulesFilter { All, Done, Uploaded, Late, Pending, Hidden }
