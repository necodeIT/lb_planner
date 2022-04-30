part of lbplanner_widgets;

/// The [LpTextButton] widget is a button that displays clickable text and an icon.
class LpTextButton extends StatelessWidget {
  /// The [LpTextButton] widget is a button that displays clickable text and an icon.
  const LpTextButton({Key? key, required this.text, this.onPressed, this.leadingIcon, this.trailingIcon, this.fontSize}) : super(key: key);

  /// The text the button displays.
  final String text;

  /// The function to call when the button is pressed.
  final VoidCallback? onPressed;

  /// The icon to display on the leading side of the button.
  final IconData? leadingIcon;

  /// The icon to display on the trailing side of the button.
  final IconData? trailingIcon;

  /// The font size of the button text.
  final double? fontSize;

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
          if (leadingIcon != null) LpIcon(leadingIcon, size: fontSize),
          if (leadingIcon != null) NcSpacing.small(),
          NcCaptionText(text, fontSize: fontSize),
          if (trailingIcon != null) NcSpacing.small(),
          if (trailingIcon != null) LpIcon(trailingIcon, size: fontSize),
        ],
      ),
    );
  }
}
