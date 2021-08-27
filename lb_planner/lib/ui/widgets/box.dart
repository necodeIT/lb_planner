import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

class NcBox extends StatelessWidget {
  NcBox({Key? key, required this.body, required this.label, this.leadingIcon, this.trailingIcon, this.width, this.height}) : super(key: key) {
    window = false;
  }
  NcBox.window({Key? key, required this.body, required this.label, this.leadingIcon, this.trailingIcon, this.width, this.height}) : super(key: key) {
    window = true;
  }

  final Widget label;
  final Widget body;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final double? width;
  final double? height;
  late final bool window;

  static const double padding = 10;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: padding, left: padding, bottom: padding),
            decoration: BoxDecoration(
              color: window ? NcThemes.current.secondaryColor : null,
              borderRadius: window ? BorderRadius.only(topLeft: Radius.circular(ncRadius), topRight: Radius.circular(ncRadius)) : null,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    leadingIcon ?? Container(),
                    SizedBox(width: ncSpacing),
                    label,
                  ],
                ),
                trailingIcon ?? Container(),
              ],
            ),
          ),
          body
        ],
      ),
      decoration: BoxDecoration(
        color: NcThemes.current.primaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(ncRadius),
        ),
      ),
    );
  }
}
