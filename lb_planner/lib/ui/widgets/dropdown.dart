import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

class NcDropdown extends StatefulWidget {
  const NcDropdown({Key? key, required this.value, required this.items, required this.icon}) : super(key: key);
  final int value;
  final List<String> items;
  final Widget icon;

  @override
  _NcDropdownState createState() => _NcDropdownState();
}

class _NcDropdownState extends State<NcDropdown> {
  late int current = widget.value;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(color: NcThemes.current.secondaryColor, borderRadius: BorderRadius.circular(7)),
      child: DropdownButton<String>(
        value: widget.items[current],
        icon: Icon(Icons.arrow_drop_down),
        underline: SizedBox(),
        onChanged: (String? value) => setState(() => current = value != null ? widget.items.indexOf(value) : current),
        items: widget.items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: NcCaptionText(value),
          );
        }).toList(),
        dropdownColor: NcThemes.current.secondaryColor,
        iconEnabledColor: NcThemes.current.textColor,
        iconDisabledColor: NcThemes.current.tertiaryColor,
      ),
    );
  }
}
