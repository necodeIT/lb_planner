//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

class NcCheckBox extends StatelessWidget {
  const NcCheckBox({
    Key? key,
    this.prefixIcon,
    this.toggle,
  }) : super(key: key);

  final Widget? prefixIcon;
  final bool? toggle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: 50.0,
      child: Center(
        child: toggle == true
            ? prefixIcon != null
                ? prefixIcon
                : Icon(Icons.check)
            : Icon(Icons.search, color: Colors.transparent),
        //child: prefixIcon != null ? prefixIcon : Icon(Icons.check),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 1.0,
          color: Colors.grey,
        ),
        borderRadius: const BorderRadius.all(const Radius.circular(2.0)),
      ),
    );
  }
}
