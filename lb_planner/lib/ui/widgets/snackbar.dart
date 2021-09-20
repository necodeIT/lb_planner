import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

class NcSnackBar {
  static const double fontSize = 18;

  static showBottomRightMessage(BuildContext context, {required String message, Widget? prefixIcon, Duration duration = const Duration(seconds: 1, milliseconds: 500)}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: duration,
        content: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 50,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(ncRadius),
                color: NcThemes.current.secondaryColor,
                boxShadow: ncShadow,
              ),
              alignment: Alignment.centerRight,
              child: Row(
                children: [
                  prefixIcon ?? Container(),
                  if (prefixIcon != null) NcSpacing.small(),
                  NcBodyText(
                    message,
                    fontSize: fontSize,
                  ),
                ],
              ),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        behavior: SnackBarBehavior.floating,
        elevation: 1000, // It just doesnt work without. dont toucht just dont BECK DONT!
      ),
    );
  }
}
