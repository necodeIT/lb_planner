import 'package:desktop/widgets/course_selection/course_selection.dart';
import 'package:desktop/widgets/views/select_courses/svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:lb_planner/ui.dart';
import 'package:lb_planner/ui/themes/theme.dart';
import 'package:lb_planner/ui/widgets/spacing.dart';
import 'package:lb_planner/ui/widgets/text/text.dart';
import 'package:lb_planner/ui/widgets/vector_image.dart';

class SelectCoursesView extends StatelessWidget {
  const SelectCoursesView({Key? key, required this.onSubmit}) : super(key: key);

  final Function() onSubmit;

  static const double imageHeightFactor = .7;
  static const double selectionWidth = 600;
  static const double selectionHeightFactor = .8;
  static const double contentPadding = 80;
  static const double fontSize = 25;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 20,
          left: 20,
          child: NcCaptionText(
            "Select courses",
            fontSize: fontSize,
          ),
        ),
        Positioned(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Container(
            padding: EdgeInsets.only(left: contentPadding, right: contentPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * selectionHeightFactor,
                  alignment: Alignment.bottomCenter,
                  child: NcVectorImage(
                    code: svg,
                    height: MediaQuery.of(context).size.height * imageHeightFactor,
                  ),
                ),
                CourseSelection(
                  height: MediaQuery.of(context).size.height * selectionHeightFactor,
                  width: selectionWidth,
                  bottomButton: Container(
                    alignment: Alignment.centerRight,
                    child: NcTextButton(
                      text: "Submit",
                      fontSize: fontSize,
                      trailingIcon: Icon(
                        Feather.arrow_right_circle,
                        color: NcThemes.current.textColor,
                      ),
                      onTap: onSubmit,
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
