//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

class NcCheckBox extends StatefulWidget {
  const NcCheckBox({
    Key? key,
    this.value = false,
    required this.onChanged,
    this.iconSize = 35,
    this.height = 40,
    this.width = 40,
    this.interactable = true,
    this.radius = defaltRadius,
  }) : super(key: key);

  final bool value;
  final bool interactable;
  final double? iconSize;
  final double? height;
  final double? width;
  final double radius;
  final Function(bool?) onChanged;

  static const double defaltRadius = 13.0;
  static const double borderWidth = 3;

  @override
  State<NcCheckBox> createState() => _NcCheckBoxState();
}

class _NcCheckBoxState extends State<NcCheckBox> {
  late bool current = widget.value;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (widget.interactable == true) {
            current = !current;
          }
        });
      },
      child: Container(
          width: widget.width,
          height: widget.height,
          child: current != false
              ? Icon(
                  Icons.check,
                  color: NcThemes.current.buttonTextColor,
                  size: widget.iconSize,
                )
              : Icon(
                  Icons.check,
                  color: Colors.transparent,
                ),
          decoration: BoxDecoration(
            border: current != true
                ? Border.all(
                    color: NcThemes.current.accentColor,
                    width: NcCheckBox.borderWidth)
                : Border.all(color: Colors.transparent, width: 0),
            borderRadius: BorderRadius.circular(widget.radius),
            color: current ? NcThemes.current.accentColor : Colors.transparent,
          )),
    );
  }
}
