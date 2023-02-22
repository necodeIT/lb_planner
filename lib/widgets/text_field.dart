part of lbplanner_widgets;

/// Themed [TextField] widget.
class LpTextField extends StatefulWidget {
  /// Themed [TextField] widget.
  LpTextField({
    Key? key,
    this.controller,
    this.focusNode,
    this.prefixIcon,
    this.suffixIcon,
    this.prefix,
    this.suffix,
    this.placeholder,
    this.errorText,
    this.helperText,
    this.enabled = true,
    this.onSubmitted,
    this.obscureText = false,
    this.autoFocus = false,
    this.maxLength,
    this.fontSize = defaultFontSize,
    this.onCancel,
    this.onUnfocus,
    this.textAlign = TextAlign.start,
    this.readOnly = false,
  }) : super(key: key) {
    filled = false;
    multiline = false;
    fillColor = null;
  }

  /// Themed [TextField] widget.
  LpTextField.filled({
    Key? key,
    this.controller,
    this.focusNode,
    this.prefixIcon,
    this.suffixIcon,
    this.prefix,
    this.suffix,
    this.placeholder,
    this.errorText,
    this.helperText,
    this.enabled = true,
    this.onSubmitted,
    this.obscureText = false,
    this.autoFocus = false,
    this.fontSize = defaultFontSize,
    this.multiline = false,
    this.maxLength,
    this.onCancel,
    Color? fillColor,
    this.onUnfocus,
    this.textAlign = TextAlign.start,
    this.readOnly = false,
  }) : super(key: key) {
    filled = true;
    this.fillColor = fillColor ?? secondaryColor;
  }

  /// Whether the [TextField] is read only.
  final bool readOnly;

  /// The controller of the [TextField].
  final TextEditingController? controller;

  /// The focus node of the [TextField].
  final FocusNode? focusNode;

  /// Called when the [TextField] is looses focus.
  final VoidCallback? onUnfocus;

  /// The maximum number of characters (Unicode scalar values) to allow in the [TextField].
  final int? maxLength;

  /// Called when the user presses the [PhysicalKeyboardKey.escape] key on the keyboard.
  final VoidCallback? onCancel;

  /// The prefix icon of the [TextField].
  final IconData? prefixIcon;

  /// The suffix icon of the [TextField].
  final IconData? suffixIcon;

  /// The prefix of the [TextField].
  final Widget? prefix;

  /// The suffix of the [TextField].
  final Widget? suffix;

  /// The placeholder of the [TextField].
  final String? placeholder;

  /// The error text of the [TextField].
  final String? errorText;

  /// The helper text of the [TextField].
  final String? helperText;

  /// Whether the [TextField] is enabled.
  final bool enabled;

  /// [TextField.textAlign]
  final TextAlign textAlign;

  /// The function to call when the [TextField] is submitted.
  final Function(String)? onSubmitted;

  /// Whether the [TextField] is obscured.
  final bool obscureText;

  /// Whether the [TextField] should auto focus.
  final bool autoFocus;

  /// The font size of the [TextField].
  final double fontSize;

  /// Whether the [TextField] should be mulitline.
  late final bool multiline;

  /// Whether the [TextField] should be filled.
  late final bool filled;

  /// The fill color of the [TextField].
  late final Color? fillColor;

  /// Font size of any feedback text like errorText
  static const double feedbackFontSize = 15;

  /// [InputDecoration.contentPadding]
  static const double filledPadding = 12;

  /// The width of the [InputBorder]
  static const double borderWidth = 2;

  /// The default [fontSize].
  static const double defaultFontSize = 20;

  /// Generates an [InputBorder] with the given [color].
  static InputBorder? border(Color color, bool filled) {
    return filled
        ? OutlineInputBorder(
            borderRadius: BorderRadius.circular(kRadius),
            borderSide: BorderSide(color: Colors.transparent),
          )
        : UnderlineInputBorder(
            // borderRadius: BorderRadius.all(Radius.circular(kRadius)),
            borderSide: BorderSide(color: color, width: borderWidth),
          );
  }

  @override
  State<LpTextField> createState() => _LpTextFieldState();
}

class _LpTextFieldState extends State<LpTextField> {
  late FocusNode focusNode = widget.focusNode ?? FocusNode();

  @override
  void initState() {
    focusNode.addListener(() {
      if (!focusNode.hasFocus) widget.onUnfocus?.call();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardListener(
      focusNode: FocusNode(skipTraversal: true),
      onKeyEvent: (event) {
        if (event.physicalKey == PhysicalKeyboardKey.escape) {
          widget.onCancel?.call();
          focusNode.unfocus();
        }
      },
      child: TextField(
        readOnly: widget.readOnly,
        autofocus: widget.autoFocus,
        obscureText: widget.obscureText,
        onSubmitted: widget.onSubmitted,
        toolbarOptions: ToolbarOptions(copy: true, cut: true, paste: true, selectAll: true),
        keyboardType: widget.multiline ? TextInputType.multiline : null,
        maxLines: widget.multiline ? null : 1,
        expands: widget.multiline,
        maxLength: widget.maxLength,
        maxLengthEnforcement: widget.maxLength != null ? MaxLengthEnforcement.enforced : null,
        textAlignVertical: widget.multiline ? TextAlignVertical.top : TextAlignVertical.center,
        textAlign: widget.textAlign,
        decoration: InputDecoration(
          contentPadding: widget.filled ? EdgeInsets.all(LpTextField.filledPadding) : EdgeInsets.symmetric(vertical: NcSpacing.smallSpacing),
          isDense: true,
          filled: widget.filled,
          fillColor: widget.fillColor,
          prefix: widget.prefix,
          prefixIcon: widget.prefixIcon != null ? LpIcon(widget.prefixIcon, size: widget.fontSize) : null,
          suffix: widget.suffix,
          suffixIcon: widget.suffixIcon != null ? LpIcon(widget.suffixIcon, size: widget.fontSize) : null,
          hintText: widget.placeholder,
          hintStyle: NcBaseText.style(fontSize: widget.fontSize),
          border: LpTextField.border(accentColor, widget.filled),
          errorBorder: LpTextField.border(errorColor, widget.filled),
          errorStyle: NcBaseText.style(color: errorColor, fontSize: LpTextField.feedbackFontSize),
          helperStyle: NcBaseText.style(color: textColor, fontSize: LpTextField.feedbackFontSize),
          enabledBorder: LpTextField.border(textColor, widget.filled),
          disabledBorder: LpTextField.border(tertiaryColor, widget.filled),
          focusedErrorBorder: LpTextField.border(accentColor, widget.filled),
          errorText: widget.errorText,
          helperText: widget.helperText,
          enabled: widget.enabled,
          focusedBorder: LpTextField.border(accentColor, widget.filled),
          focusColor: widget.fillColor,
          hoverColor: widget.fillColor,
        ),
        style: NcBaseText.style(fontSize: widget.fontSize),
        controller: widget.controller,
        focusNode: focusNode,
      ),
    );
  }
}
