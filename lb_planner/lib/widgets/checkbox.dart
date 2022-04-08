part of lbplanner_widgets;

/// Themed [CheckBox] widget.
class NcCheckbox extends StatelessWidget {
  /// Themed [CheckBox] widget.
  const NcCheckbox({Key? key, required this.value, this.onChanged}) : super(key: key);

  /// The current value of the checkbox.
  final bool value;

  /// Called when the value of the checkbox changes.
  final ValueChanged<bool>? onChanged;

  /// Width used for the border.
  static const borderWidth = 1.5;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value,
      onChanged: (value) => onChanged?.call(value ?? false),
      activeColor: accentColor,
      splashRadius: 0,
      side: BorderSide(color: accentColor, width: borderWidth),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kRadius),
      ),
    );
  }
}
