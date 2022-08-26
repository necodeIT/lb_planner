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
  CourseEditController? _editController;

  void _showEditDialog(WidgetRef ref) {
    var course = ref.watch(coursesProvider)[widget.courseId]!;

    _editController = CourseEditController(id: course.id, shortname: course.shortname, color: course.color);

    lpShowConfirmDialog(
      context,
      confirmIsBad: false,
      header: CourseEditDialogHeader(controller: _editController!),
      body: CourseEditDialogBody(controller: _editController!),
      onConfirm: () => _updateCourse(ref),
    );
  }

  void _enableCourse(bool value, WidgetRef ref) async {
    if (_updateFuture != null) return;

    var controller = ref.read(coursesController);

    setState(() {
      _updateFuture = controller.enableCourse(widget.courseId, value);
    });

    await _updateFuture;

    if (!mounted) return;

    setState(() {
      _updateFuture = null;
    });
  }

  void _updateCourse(WidgetRef ref) async {
    if (_updateFuture != null || _editController == null) return;

    var controller = ref.read(coursesController);

    setState(() {
      _updateFuture = controller.updateCourseColor(_editController!.id, _editController!.color);
    });

    await _updateFuture;
    await controller.updateCourseShortname(_editController!.id, _editController!.shortname);

    if (!mounted) return;

    setState(() {
      _updateFuture = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        var course = ref.watch(coursesProvider)[widget.courseId];

        if (course == null) return LpShimmer();

        return Row(
          children: [
            LpCheckbox(
              value: course.enabled,
              onChanged: (value) => _enableCourse(value, ref),
              // ignore: no-magic-number
              scale: 1.2,
            ),
            NcSpacing.small(),
            LpTag(
              text: course.shortname,
              color: course.color,
              // ignore: no-magic-number
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
                      child: LpLoadingIndicator.linear(
                        // ignore: no-magic-number
                        thickness: 2,
                      ),
                    ),
                    falseWidget: (_) => child,
                  ),
                ),
                child: NcBodyText(
                  course.name,
                  fontSize: LoginSelectCourseCourseSelection.searchFontSize,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            NcSpacing.small(),
            HoverBuilder(
              onTap: () => _showEditDialog(ref),
              builder: (context, hover) => LpIcon(
                Icons.more_horiz,
                color: hover ? accentColor : null,
              ),
            ),
          ],
        );
      },
    );
  }
}
