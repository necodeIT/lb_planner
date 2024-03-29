part of lbplanner_routes;

/// The header of the cours edit dialog.
class CourseEditDialogHeader extends StatefulWidget {
  /// The header of the cours edit dialog.
  const CourseEditDialogHeader({Key? key, required this.controller}) : super(key: key);

  /// The controller to use.
  final CourseEditController controller;

  /// The max length of the shortname.
  static const maxShortNameLength = 5;

  @override
  State<CourseEditDialogHeader> createState() => _CourseEditDialogHeaderState();
}

class _CourseEditDialogHeaderState extends State<CourseEditDialogHeader> {
  bool _editMode = false;
  final TextEditingController _shortnameController = TextEditingController();
  final FocusNode _shortnameFocusNode = FocusNode();

  _enterEditMode() {
    setState(() {
      _editMode = true;
      _shortnameController.text = widget.controller.shortname;
    });

    _shortnameFocusNode.requestFocus();
  }

  _leaveEditMode() {
    setState(() {
      _editMode = false;
    });
  }

  @override
  void initState() {
    widget.controller.addListener(rebuild);
    super.initState();
  }

  @override
  void dispose() {
    widget.controller.removeListener(rebuild);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      var course = ref.watch(coursesProvider)[widget.controller.id];

      return ConditionalWrapper(
        condition: !_editMode,
        wrapper: (context, child) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            child,
            LpGestureDetector(
              onTap: _enterEditMode,
              child: LpIcon(
                Icons.edit,
              ),
            ),
          ],
        ),
        child: Row(
          children: [
            ConditionalWidget(
              condition: _editMode,
              trueWidget: (context) => Expanded(
                child: LpTextField.filled(
                  controller: _shortnameController,
                  focusNode: _shortnameFocusNode,
                  onCancel: _leaveEditMode,
                  maxLength: CourseEditDialogHeader.maxShortNameLength,
                  autoFocus: true,
                  onSubmitted: (value) {
                    widget.controller.shortname = value;
                    _leaveEditMode();
                  },
                ),
              ),
              falseWidget: (context) => LpGestureDetector(
                onDoubleTap: _enterEditMode,
                child: LpTag(text: widget.controller.shortname, color: widget.controller.color),
              ),
            ),
            if (course != null && !_editMode) NcSpacing.small(),
            if (course != null && !_editMode)
              NcCaptionText(
                course.name,
              ),
          ],
        ),
      );
    });
  }
}
