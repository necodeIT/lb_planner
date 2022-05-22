part of lbplanner_widgets;

/// A button that can be used to trigger an action.
class LpButton extends StatelessWidget {
  /// A button that can be used to trigger an action.
  LpButton({
    Key? key,
    this.text,
    this.child,
    this.onPressed,
    this.color,
    this.fontSize = defaultFontSize,
    this.padding = defaultPadding,
  }) : super(key: key) {
    assert(text != null || child != null, "Either text or child must be provided.");
    icon = null;
    trailing = null;
    size = null;
    alignment = null;
  }

  /// A button that can be used to trigger an action with icons.
  LpButton.icon({
    Key? key,
    this.text,
    this.child,
    this.onPressed,
    this.color,
    required this.icon,
    this.size = MainAxisSize.min,
    this.alignment = MainAxisAlignment.center,
    this.trailing = false,
    this.fontSize = defaultFontSize,
    this.padding = defaultPadding,
  }) : super(key: key) {
    assert(text != null || child != null, "Either text or child must be provided.");
    assert(size != null, "Size must be provided.");
    assert(trailing != null, "Trailing must be provided.");
  }

  /// The text to display inside the button if not set [child] will be used instead.
  final String? text;

  /// The child to display inside the button if not set [text] will be used instead.
  final Widget? child;

  /// The action to trigger when the button is pressed.
  final VoidCallback? onPressed;

  /// The font size to use if [text] is set.
  final double fontSize;

  /// The padding to use.
  final double padding;

  /// The color of the button if not set [accentColor] will be used instead.
  final Color? color;

  /// The icon to display inside the button.
  late final IconData? icon;

  /// The [MainAxisSize] to use for the icon button.
  late final MainAxisSize? size;

  /// The [MainAxisAlignment] to use for the icon button.
  late final MainAxisAlignment? alignment;

  /// Whether [icon] should be at the end or at the beginning.
  late final bool? trailing;

  /// The default [fontSize] to use.
  static const double defaultFontSize = 14;

  /// The default [padding] to use.
  static const double defaultPadding = NcSpacing.smallSpacing;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: kNormalAnimationDuration,
      child: ElevatedButton(
        child: ConditionalWrapper(
          condition: icon != null,
          wrapper: (context, child) => Row(
            mainAxisSize: size!,
            mainAxisAlignment: alignment!,
            children: [
              if (trailing!) child,
              if (trailing! && size == MainAxisSize.min) NcSpacing.small(),
              Icon(icon, color: buttonTextColor, size: fontSize),
              if (!trailing! && size == MainAxisSize.min) NcSpacing.small(),
              if (!trailing!) child,
            ],
          ),
          child: ConditionalWidget(
            condition: text != null,
            trueWidget: (context) => NcTitleText(
              text!,
              buttonText: true,
              fontSize: fontSize,
            ),
            falseWidget: (context) => child!,
          ),
        ),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(padding),
          primary: color ?? accentColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kRadius),
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
