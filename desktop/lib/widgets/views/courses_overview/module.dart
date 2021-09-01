import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:lb_planner/data.dart';
import 'package:lb_planner/ui.dart';

class CourseOverviewModuleItem extends StatefulWidget {
  CourseOverviewModuleItem({
    Key? key,
    required this.id,
  }) : super(key: key);

  final int id;
  static const double borderWidth = 2;
  static const double indicatorWidth = 5;
  static const double fontSize = 20;

  @override
  _CourseOverviewModuleItemState createState() => _CourseOverviewModuleItemState();
}

class _CourseOverviewModuleItemState extends State<CourseOverviewModuleItem> {
  final double? height = 40;

  final BoxDecoration border = BoxDecoration(
    border: Border(
      top: BorderSide(
        color: NcThemes.current.tertiaryColor,
        width: CourseOverviewModuleItem.borderWidth,
      ),
      right: BorderSide(
        color: NcThemes.current.tertiaryColor,
        width: CourseOverviewModuleItem.borderWidth,
      ),
      bottom: BorderSide(
        color: NcThemes.current.tertiaryColor,
        width: CourseOverviewModuleItem.borderWidth,
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: Row(
        children: [
          Container(
            height: height,
            width: CourseOverviewModuleItem.indicatorWidth,
            //height: 40,
            color: NcThemes.current.doneColor,
          ),
          Expanded(
            flex: 8,
            child: Container(
              height: height,
              decoration: border,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 10),
                      child: NcCaptionText(
                        'Klassenlektüre Ringparabel',
                        fontSize: CourseOverviewModuleItem.fontSize,
                      ),
                    ),
                  ),
                  NcSpacing.small(),
                  Container(
                    child: GestureDetector(
                      child: Icon(
                        // TODO: DB.modules[widget.id]!.isEnabled ? FontAwesome5Solid.eye : FontAwesome5Solid.eye_slash,
                        FontAwesome5Solid.eye,
                        color: NcThemes.current.textColor,
                        size: 17,
                      ),
                      onTap: () {
                        print("Toggle Enabled");
                        // TODO: setState(() { DB.modules[widget.id]!.isEnabled = !DB.modules[widget.id]!.isEnabled; });
                      },
                    ),
                  ),
                  NcSpacing.small(),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              height: height,
              decoration: border,
              child: Center(
                child: NcCaptionText(
                  '22.8.21',
                  fontSize: CourseOverviewModuleItem.fontSize,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              height: height,
              decoration: border,
              child: Center(
                child: NcCaptionText(
                  '22.8.CourseOverviewItem.fontSize21',
                  fontSize: CourseOverviewModuleItem.fontSize,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              height: height,
              decoration: border,
              child: Center(
                child: NcTitleText(
                  '1',
                  fontSize: CourseOverviewModuleItem.fontSize,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              height: height,
              decoration: border,
              child: Center(
                child: NcTextButton(
                  text: "Moodle",
                  fontSize: CourseOverviewModuleItem.fontSize,
                  onTap: () {},
                  trailingIcon: Icon(
                    Icons.upcoming,
                    color: NcThemes.current.textColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
