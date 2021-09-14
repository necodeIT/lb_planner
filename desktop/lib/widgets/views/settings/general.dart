import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

class SettingsGeneralItem extends StatelessWidget {
  SettingsGeneralItem({Key? key, required this.icon, this.fontsize = defaultFontSize, this.iconHeight = defaultIconHeight, this.iconWidth = defaultIconWidth, required this.text, required this.onTap});

  final String text;
  final IconData icon;
  final double fontsize;
  final double iconHeight;
  final double iconWidth;
  final Function() onTap;

  static const double defaultFontSize = 20;
  static const double defaultIconHeight = 30;
  static const double defaultIconWidth = 30;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: NcCaptionText(
            text,
            fontSize: fontsize,
          ),
        ),
        NcSpacing.small(),
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: iconHeight,
            width: iconWidth,
            decoration: new BoxDecoration(
              color: NcThemes.current.secondaryColor,
              borderRadius: BorderRadius.all(Radius.circular(ncRadius)),
            ),
            child: Center(
              child: Icon(
                icon,
                color: NcThemes.current.textColor,
                size: fontsize,
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
