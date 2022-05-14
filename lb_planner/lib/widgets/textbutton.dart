part of lbplanner_widgets;

/// The [LpTextButton] widget is a button that displays clickable text and an icon.
class LpTextButton extends StatelessWidget {
  /// The [LpTextButton] widget is a button that displays clickable text and an icon.
  const LpTextButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.leadingIcon,
    this.trailingIcon,
    this.fontSize,
    this.color,
    this.decoration = TextDecoration.none,
    this.leading,
    this.trailing,
  }) : super(key: key);

  /// The text the button displays.
  final String text;

  /// The function to call when the button is pressed.
  final VoidCallback? onPressed;

  /// The icon to display on the leading side of the button.
  final IconData? leadingIcon;

  /// The icon to display on the trailing side of the button.
  final IconData? trailingIcon;

  /// The leading widget to display on the button. This is ignored if [leadingIcon] is not null.
  final Widget? leading;

  /// The trailing widget to display on the button. This is ignored if [trailingIcon] is not null.
  final Widget? trailing;

  /// The font size of the button text.
  final double? fontSize;

  /// The color of the button text.
  final Color? color;

  /// The text decoration of the button text.
  final TextDecoration decoration;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        primary: accentColor,
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (leadingIcon != null) LpIcon(leadingIcon, size: fontSize, color: color),
          if (leading != null && leadingIcon == null) leading!,
          if (leadingIcon != null || leading != null) NcSpacing.small(),
          NcCaptionText(text, fontSize: fontSize, color: color, decoration: decoration),
          if (trailingIcon != null || trailing != null) NcSpacing.small(),
          if (trailing != null && trailingIcon == null) trailing!,
          if (trailingIcon != null) LpIcon(trailingIcon, size: fontSize, color: color),
        ],
      ),
    );
  }
}
