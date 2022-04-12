part of lbplanner_widgets;

/// Themed [DropdownButton] widget.
class LpDropdown<T> extends StatelessWidget {
  /// Themed [DropdownButton] widget.
  const LpDropdown({Key? key, required this.items, required this.onChanged, this.color, this.value}) : super(key: key);

  /// The items to display in the dropdown.
  final List<DropdownMenuItem<T>> items;

  /// The callback that is called when the user selects an item.
  final void Function(T?) onChanged;

  /// The color of the dropdown button.
  final Color? color;

  /// The value of the dropdown button.
  final T? value;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<T>(
      value: value,
      items: items,
      onChanged: onChanged,
      dropdownColor: color ?? primaryColor,
      style: TextStyle(color: textColor),
      icon: Icon(Icons.arrow_downward, color: textColor),
      borderRadius: BorderRadius.circular(kRadius),
      underline: SizedBox.shrink(),
      focusColor: Colors.transparent,
    );
  }
}
