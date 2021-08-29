import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

class NcTag extends StatelessWidget {
  const NcTag({Key? key, required this.text, required this.backgroundColor, this.width, this.height = 25}) : super(key: key);
  final Color backgroundColor;
  final String text;
  final double? width;
  final double height;

  static const double padding = 10;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: padding, right: padding),
      width: width,
      height: height,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(7), color: backgroundColor),
      child: Center(
        child: NcTitleText(
          text,
          buttonText: true,
        ),
      ),
    );
  }
}
