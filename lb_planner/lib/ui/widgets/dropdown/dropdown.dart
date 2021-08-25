import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

class NcDropdown extends StatefulWidget {
  const NcDropdown({Key? key, required this.dropdownValue, this.length}) : super(key: key);
  final String dropdownValue;
  final int length;
  
  @override
  _NcDropdownState createState() => _NcDropdownState();
}

class _NcDropdownState extends State<NcDropdown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
    );
  }
}
