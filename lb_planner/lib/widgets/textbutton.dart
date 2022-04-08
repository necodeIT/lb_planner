part of lbplanner_widgets;

/// The [NcTextButton] widget is a button that displays clickable text and an icon.
class NcTextButton extends StatelessWidget {
  /// The [NcTextButton] widget is a button that displays clickable text and an icon.
  const NcTextButton({Key? key, required this.text, this.onPressed, this.leadingIcon, this.trailingIcon}) : super(key: key);

  /// The text the button displays.
  final String text;

  /// The function to call when the button is pressed.
  final VoidCallback? onPressed;

  /// The icon to display on the leading side of the button.
  final IconData? leadingIcon;

  /// The icon to display on the trailing side of the button.
  final IconData? trailingIcon;

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
          if (leadingIcon != null) Icon(leadingIcon, color: textColor),
          if (leadingIcon != null) NcSpacing.small(),
          NcCaptionText(text),
          if (trailingIcon != null) NcSpacing.small(),
          if (trailingIcon != null) Icon(trailingIcon, color: textColor),
        ],
      ),
    );
  }
}
