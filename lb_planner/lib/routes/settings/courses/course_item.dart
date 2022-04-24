part of lbplanner_routes;

/// Course item for [SettingsCourses].
class SettingsCourseItem extends StatefulWidget {
  /// Course item for [SettingsCourses].
  const SettingsCourseItem({Key? key, required this.courseId}) : super(key: key);

  /// The course id to display.
  final int courseId;

  /// The font size of the items.
  // static const double fontSize = 10;

  @override
  State<SettingsCourseItem> createState() => _SettingsCourseItemState();
}

class _SettingsCourseItemState extends State<SettingsCourseItem> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        var course = ref.watch(coursesProvider)[widget.courseId]!;
        var controller = ref.watch(coursesController);

        return Row(
          children: [
            LpCheckbox(
              value: course.enabled,
              onChanged: (value) => controller.enableCourse(widget.courseId, value),
              scale: 1.2,
            ),
            NcSpacing.small(),
            LpTag(
              text: course.shortname,
              color: course.color,
              fontSize: 14,
            ),
            NcSpacing.small(),
            Expanded(
              child: NcBodyText(
                course.name,
                fontSize: 18,
                textAlign: TextAlign.center,
              ),
            ),
            NcSpacing.small(),
            IconButton(
              icon: LpIcon(Icons.more_horiz),
              onPressed: () {},
            ),
          ],
        );
      },
    );
  }
}
