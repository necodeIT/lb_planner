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
  Future<RawApiResponse>? _updateFuture;

  void _enableCourse(bool value, CoursesProvider controller) async {
    _updateFuture = null;

    setState(() {
      _updateFuture = controller.enableCourse(widget.courseId, value);
    });

    await _updateFuture;

    setState(() {
      _updateFuture = null;
    });
  }

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
              onChanged: (value) => _enableCourse(value, controller),
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
              child: ConditionalWrapper(
                condition: _updateFuture != null,
                wrapper: (context, child) => FutureBuilder(
                  future: _updateFuture,
                  builder: (context, snapshot) => ConditionalWidget(
                    condition: snapshot.connectionState != ConnectionState.done,
                    trueWidget: (_) => Padding(
                      padding: EdgeInsets.all(NcSpacing.smallSpacing),
                      child: LpLoadingIndicator(
                        thickness: 2,
                      ),
                    ),
                    falseWidget: (_) => child,
                  ),
                ),
                child: NcBodyText(
                  course.name,
                  fontSize: 18,
                  textAlign: TextAlign.center,
                ),
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
