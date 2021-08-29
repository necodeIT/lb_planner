import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

class NcSnackBar {
  static SnackBar bottomRight({required Widget content, Widget? prefixIcon, Duration duration = const Duration(seconds: 1, milliseconds: 500)}) {
    return SnackBar(
      duration: duration,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 50,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ncRadius),
              color: NcThemes.current.tertiaryColor,
              boxShadow: ncShadow,
            ),
            alignment: Alignment.centerRight,
            child: Row(
              children: [
                prefixIcon ?? Container(),
                if (prefixIcon != null) NcSpacing.small(),
                content,
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.transparent,
      behavior: SnackBarBehavior.floating,
      elevation: 1000, // It just doesnt work without. dont toucht just dont BECK DONT!
    );
  }
}
