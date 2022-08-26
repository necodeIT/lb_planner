part of lbplanner_widgets;

/// Themed [CheckBox] widget.
class LpCheckbox extends StatelessWidget {
  /// Themed [CheckBox] widget.
  const LpCheckbox({Key? key, required this.value, this.onChanged, this.scale = 1}) : super(key: key);

  /// The current value of the checkbox.
  final bool value;

  /// Called when the value of the checkbox changes.
  final ValueChanged<bool>? onChanged;

  /// The scale of the checkbox.
  final double scale;

  /// Width used for the border.
  static const borderWidth = 1.5;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale,
      child: ScaleOnHover(
        duration: kFastAnimationDuration,
        // ignore: no-magic-number
        scale: onChanged != null ? 1.1 : 1,
        child: Checkbox(
          mouseCursor: onChanged != null ? kDefaultHoverCursor : SystemMouseCursors.basic,
          focusColor: accentColor,
          value: value,
          onChanged: (value) => onChanged?.call(value ?? false),
          activeColor: accentColor,
          splashRadius: 0,
          checkColor: buttonTextColor,
          side: BorderSide(color: accentColor, width: borderWidth),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kRadius),
          ),
        ),
      ),
    );
  }
}
