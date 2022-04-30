part of lbplanner_widgets;

/// Themed [DropdownButton] widget.
class LpDropdown<T> extends StatelessWidget {
  /// Themed [DropdownButton] widget.
  const LpDropdown({Key? key, required this.items, required this.onChanged, this.color, this.value, this.fontSize}) : super(key: key);

  /// The items to display in the dropdown.
  final List<DropdownMenuItem<T>> items;

  /// The callback that is called when the user selects an item.
  final void Function(T?) onChanged;

  /// The color of the dropdown button.
  final Color? color;

  /// The value of the dropdown button.
  final T? value;

  /// The font size of the dropdown button.
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<T>(
      value: value,
      items: items,
      onChanged: onChanged,
      dropdownColor: color ?? primaryColor,
      style: NcBaseText.style(fontSize: fontSize),
      icon: LpIcon(
        Ionicons.chevron_down,
        size: fontSize,
      ),
      borderRadius: BorderRadius.circular(kRadius),
      underline: SizedBox.shrink(),
      focusColor: Colors.transparent,
    );
  }
}
