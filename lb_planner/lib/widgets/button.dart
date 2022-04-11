part of lbplanner_widgets;

/// A button that can be used to trigger an action.
class NcButton extends StatelessWidget {
  /// A button that can be used to trigger an action.
  NcButton({Key? key, this.text, this.child, this.onPressed, this.color}) : super(key: key) {
    assert(text != null || child != null, "Either text or child must be provided.");
    icon = null;
    trailing = null;
    size = null;
  }

  /// A button that can be used to trigger an action with icons.
  NcButton.icon({Key? key, this.text, this.child, this.onPressed, this.color, required this.icon, this.size = MainAxisSize.min, this.trailing = false}) : super(key: key) {
    assert(text != null || child != null, "Either text or child must be provided.");
    assert(icon != null, "Icon must be provided.");
    assert(size != null, "Size must be provided.");
    assert(trailing != null, "Trailing must be provided.");
  }

  /// The text to display inside the button if not set [child] will be used instead.
  final String? text;

  /// The child to display inside the button if not set [text] will be used instead.
  final Widget? child;

  /// The action to trigger when the button is pressed.
  final VoidCallback? onPressed;

  /// The color of the button if not set [accentColor] will be used instead.
  final Color? color;

  /// The icon to display inside the button.
  late final IconData? icon;

  /// The [MainAxisSize] to use for the icon button.
  late final MainAxisSize? size;

  /// Whether [icon] should be at the end or at the beginning.
  late final bool? trailing;

  /// Size of [NcButton.icon].
  static const double iconSize = 19;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: ConditionalWrapper(
        condition: icon != null,
        wrapper: (context, child) => Row(
          mainAxisSize: size!,
          mainAxisAlignment: size == MainAxisSize.min ? MainAxisAlignment.center : MainAxisAlignment.spaceBetween,
          children: [
            if (trailing!) child,
            if (trailing! && size == MainAxisSize.min) NcSpacing.small(),
            Icon(icon, color: buttonTextColor, size: iconSize),
            if (!trailing! && size == MainAxisSize.min) NcSpacing.small(),
            if (!trailing!) child,
          ],
        ),
        child: ConditionalWidget(
          condition: text != null,
          trueWidget: (context) => NcTitleText(
            text!,
            buttonText: true,
          ),
          falseWidget: (context) => child!,
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: color ?? accentColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kRadius),
        ),
      ),
      onPressed: onPressed,
    );
  }
}
