//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

class NcCheckBox extends StatefulWidget {
  const NcCheckBox({
    Key? key,
    this.prefixIcon,
    this.value = false,
    required this.onChanged,
    this.scale = 1,
  }) : super(key: key);

  final Widget? prefixIcon;
  final bool value;
  final double scale;
  final Function(bool?) onChanged;

  @override
  State<NcCheckBox> createState() => _NcCheckBoxState();
}

class _NcCheckBoxState extends State<NcCheckBox> {
  late bool current = widget.value;
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: widget.scale,
      child: Checkbox(
          value: current,
          onChanged: (value) {
            setState(() {
              current = value!;
              widget.onChanged(current);
            });
          }),
    );
  }
}
