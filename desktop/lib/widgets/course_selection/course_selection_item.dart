import 'package:desktop/dialogs/edit_course_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:lb_planner/ui.dart';

class CourseSelectionItem extends StatelessWidget {
  CourseSelectionItem({Key? key, required this.id, this.margin = true}) : super(key: key);

  final int id;
  final bool margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      margin: margin ? EdgeInsets.only(bottom: 10.0) : null,
      height: 40,
      decoration: BoxDecoration(
        color: NcThemes.current.secondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                NcCheckBox(
                  interactable: true,
                  radius: 8,
                  onChanged: (_) {},
                  width: 25,
                  height: 25,
                  iconSize: 25,
                ),
                NcSpacing.small(),
                NcTag(
                  fontSize: 17,
                  height: 27,
                  text: 'AM',
                  //TODO:text: DB.courses[DB.modules[id]!.course]!.tag,
                  backgroundColor: NcThemes.current.accentColor,
                  //width: 40,
                ),
              ],
            ),
            NcBodyText(
              //TODO:DB.modules[id]!.name,
              'Hallo',
              fontSize: 20,
            ),
            GestureDetector(
              onTap: () => showEditCourseDialog(context, id),
              child: Icon(
                Icons.more_horiz,
                color: NcThemes.current.textColor,
                size: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
