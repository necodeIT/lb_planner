part of lbplanner_widgets;

/// A button that can be used to trigger an action.
class NcButton extends StatelessWidget {
  /// A button that can be used to trigger an action.
  NcButton({Key? key, this.text, this.child, this.onPressed, this.color}) : super(key: key) {
    assert(text != null || child != null, "Either text or child must be provided.");
  }

  /// The text to display inside the button if not set [child] will be used instead.
  final String? text;

  /// The child to display inside the button if not set [text] will be used instead.
  final Widget? child;

  /// The action to trigger when the button is pressed.
  final VoidCallback? onPressed;

  /// The color of the button if not set [accentColor] will be used instead.
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: ConditionalWidget(
        condition: text != null,
        trueWidget: (context) => NcTitleText(
          text!,
          buttonText: true,
        ),
        falseWidget: (context) => child!,
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
