import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

class NcDropdown extends StatefulWidget {
  const NcDropdown({Key? key, required this.value, required this.items, this.icon, this.fontSize, required this.onValueChanged, this.height = defaultHeight}) : super(key: key);
  final int value;
  final List<String> items;
  final Widget? icon;
  final double? fontSize;
  final double height;
  final Function(int) onValueChanged;

  static const double padding = 10;
  static const double defaultHeight = 40;

  @override
  _NcDropdownState createState() => _NcDropdownState();
}

class _NcDropdownState extends State<NcDropdown> {
  late int current = widget.value;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      padding: EdgeInsets.symmetric(horizontal: NcDropdown.padding),
      decoration: BoxDecoration(color: NcThemes.current.secondaryColor, borderRadius: BorderRadius.circular(ncRadius)),
      child: DropdownButton<String>(
        focusColor: NcThemes.current.secondaryColor,
        value: widget.items[current],
        icon: widget.icon ?? Icon(Icons.arrow_drop_down, color: NcThemes.current.textColor),
        underline: SizedBox(),
        onChanged: (String? value) {
          setState(() => current = value != null ? widget.items.indexOf(value) : current);
          widget.onValueChanged(current);
        },
        items: widget.items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Container(
              child: NcCaptionText(value, fontSize: widget.fontSize),
            ),
          );
        }).toList(),
        dropdownColor: NcThemes.current.secondaryColor,
        iconEnabledColor: NcThemes.current.textColor,
        iconDisabledColor: NcThemes.current.tertiaryColor,
      ),
    );
  }
}
