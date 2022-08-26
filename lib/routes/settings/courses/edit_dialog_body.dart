part of lbplanner_routes;

/// Course edit dialog body.
class CourseEditDialogBody extends StatefulWidget {
  /// Course edit dialog body.
  const CourseEditDialogBody({Key? key, required this.controller}) : super(key: key);

  /// The controller to use.
  final CourseEditController controller;

  /// Predifined course colors to select from.
  static const colors = [
    Color(0xFFf50057),
    Color(0xFF536dfe),
    Color(0xFFf9a826),
    Color(0xFF00bfa6),
    Color(0xFF9b59b6),
    Color(0xFF37bbca),
    Color(0xFFe67e22),
    Color(0xFF37CA48),
    Color(0xFFCA3737),
    Color(0xFFB5CA37),
    Color(0xFF37CA9E),
    Color(0xFF3792CA),
    Color(0xFF376ECA),
    Color(0xFF8B37CA),
    Color(0xFFCA37B9),
  ];

  /// The size of the color buttons.
  static const double colorSize = 40;

  @override
  State<CourseEditDialogBody> createState() => _CourseEditDialogBodyState();
}

class _CourseEditDialogBodyState extends State<CourseEditDialogBody> {
  final TextEditingController _colorController = TextEditingController();
  final FocusNode _colorFocusNode = FocusNode();
  String? errorMsg;

  @override
  void initState() {
    widget.controller.addListener(rebuild);
    super.initState();
  }

  void _updateColor(String value) {
    errorMsg = null;

    try {
      widget.controller.color = ColorUtils.fromHexCode(value);
    } catch (e) {
      setState(() {
        errorMsg = t.settings_courses_editCourse_invalidHexCode;
      });
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(rebuild);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _colorController.text = widget.controller.color.hexCode.toUpperCase();
    _colorFocusNode.unfocus();

    return LayoutBuilder(
      builder: (context, box) => Column(
        children: [
          ColorPicker(
            pickerColor: widget.controller.color,
            onColorChanged: (color) => widget.controller.color = color,
            labelTypes: const [],
            portraitOnly: true,
            colorPickerWidth: box.maxWidth,
            pickerAreaHeightPercent: 0.5,
            pickerAreaBorderRadius: BorderRadius.circular(kRadius),
            displayThumbColor: true,
            enableAlpha: false,
          ),
          LpTextField.filled(
            textAlign: TextAlign.center,
            controller: _colorController,
            onSubmitted: _updateColor,
            errorText: errorMsg,
            focusNode: _colorFocusNode,
          ),
          NcSpacing.medium(),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: NcSpacing.largeSpacing,
            runSpacing: NcSpacing.largeSpacing,
            children: CourseEditDialogBody.colors.map((color) {
              return LpGestureDetector(
                onTap: () => widget.controller.color = color,
                child: Container(
                  width: CourseEditDialogBody.colorSize,
                  height: CourseEditDialogBody.colorSize,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(kRadius),
                  ),
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}

/// Controller for the [CourseEditDialogBody].
class CourseEditController {
  final List<VoidCallback> _listeners = [];
  String _shortname = '';
  Color _color = Colors.transparent;

  /// Controller for the [CourseEditDialogBody].
  CourseEditController({required this.id, required String shortname, required Color color}) {
    _shortname = shortname;
    _color = color;
  }

  /// The shortname of the course.
  String get shortname => _shortname;

  /// The color of the course.
  Color get color => _color;

  set color(Color value) {
    _color = value;
    _callListeners();
  }

  set shortname(String value) {
    _shortname = value;
    _callListeners();
  }

  void _callListeners() {
    for (var listener in _listeners) {
      listener();
    }
  }

  /// The id of the course.
  final int id;

  /// Adds a listener to the controller.
  void addListener(VoidCallback listener) {
    _listeners.add(listener);
  }

  /// Removes a listener from the controller.
  void removeListener(VoidCallback listener) {
    _listeners.remove(listener);
  }
}
