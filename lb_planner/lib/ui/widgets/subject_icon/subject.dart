import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

class NcSubject extends StatelessWidget {
  const NcSubject({ Key? key, required this.subjectName, required this.backgroundColor, this.width, this.height}) : super(key: key);
  final Color backgroundColor;
  final String subjectName;
  final int? width;
  final int? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      height: 25,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(7), color: backgroundColor),
      child: Center(
        child:
        NcTitleText(subjectName),
      )
    );
  }
}