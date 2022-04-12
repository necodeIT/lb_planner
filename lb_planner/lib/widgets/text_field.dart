part of lbplanner_widgets;

/// Themed [TextField] widget.
class LpTextField extends StatelessWidget {
  /// Themed [TextField] widget.
  const LpTextField({
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
    this.fontSize = 20,
  }) : super(key: key);

  /// The controller of the [TextField].
  final TextEditingController? controller;

  /// The focus node of the [TextField].
  final FocusNode? focusNode;

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

  /// The function to call when the [TextField] is submitted.
  final Function(String)? onSubmitted;

  /// Whether the [TextField] is obscured.
  final bool obscureText;

  /// Whether the [TextField] should auto focus.
  final bool autoFocus;

  /// The font size of the [TextField].
  final double fontSize;

  /// Font size of any feedback text like errorText
  static const double feedbackFontSize = 15;

  /// Generates an [InputBorder] with the given [color].
  static InputBorder border(Color color) => UnderlineInputBorder(
        // borderRadius: BorderRadius.all(Radius.circular(kRadius)),
        borderSide: BorderSide(color: color, width: 2),
      );

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: autoFocus,
      obscureText: obscureText,
      onSubmitted: onSubmitted,
      toolbarOptions: ToolbarOptions(copy: true, cut: true, paste: true, selectAll: true),
      decoration: InputDecoration(
        prefix: prefix,
        prefixIcon: prefixIcon != null ? LpIcon(prefixIcon, size: fontSize) : null,
        suffix: suffix,
        suffixIcon: suffixIcon != null ? LpIcon(suffixIcon, size: fontSize) : null,
        hintText: placeholder,
        hintStyle: NcBaseText.style(fontSize: fontSize),
        border: border(accentColor),
        errorBorder: border(errorColor),
        errorStyle: NcBaseText.style(color: errorColor, fontSize: feedbackFontSize),
        helperStyle: NcBaseText.style(color: textColor, fontSize: feedbackFontSize),
        enabledBorder: border(textColor),
        disabledBorder: border(tertiaryColor),
        errorText: errorText,
        helperText: helperText,
        enabled: enabled,
        focusedBorder: border(accentColor),
      ),
      style: NcBaseText.style(fontSize: fontSize),
      controller: controller,
      focusNode: focusNode,
    );
  }
}
