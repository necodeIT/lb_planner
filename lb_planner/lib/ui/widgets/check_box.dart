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
    this.ncColor,
  }) : super(key: key);

  final bool value;
  final double? iconSize;
  final double? height;
  final double? width;
  final Color? ncColor;
  final Function(bool?) onChanged;

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
          current = !current;
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
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 0.1,
                blurRadius: 10,
                offset: Offset(0, 0), // changes position of shadow
              ),
            ],
            //boxShadow: ,
            border: current != true
                ? Border.all(color: NcThemes.current.accentColor, width: 3)
                : Border.all(color: Colors.transparent, width: 0),
            borderRadius: BorderRadius.circular(13.0),
            color: current != false
                ? NcThemes.current.accentColor
                : widget.ncColor == null
                    ? NcThemes.current.tertiaryColor
                    : widget.ncColor,
          )),
    );
  }
}
