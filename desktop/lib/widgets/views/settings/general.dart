import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:lb_planner/ui.dart';

class SettingsGeneralItem extends StatelessWidget {
  SettingsGeneralItem({
    Key? key,
    this.trailingIcon,
    this.fontsize = 20,
    this.height = 40,
    this.width = 40,
  });

  final IconData? trailingIcon;
  final double? fontsize;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        NcCaptionText(
          'ddd',
          fontSize: fontsize,
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            height: height,
            width: width,
            decoration: new BoxDecoration(
              color: NcThemes.current.primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Center(
              child: Icon(
                trailingIcon,
                color: NcThemes.current.buttonTextColor,
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
