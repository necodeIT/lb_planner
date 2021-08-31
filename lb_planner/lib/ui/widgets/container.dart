import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

class NcContainer extends StatelessWidget {
  NcContainer({Key? key, required this.label, required this.body, this.leadingIcon, this.trailingIcon, this.width, this.height}) : super(key: key) {
    window = false;
  }
  NcContainer.window({Key? key, required this.body, required this.label, this.leadingIcon, this.trailingIcon, this.width, this.height}) : super(key: key) {
    window = true;
  }

  final Widget label;
  final Widget body;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final double? width;
  final double? height;
  late final bool window;

  static const double padding = 15;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      width: width,
      height: height,
      child: Column(
        children: [
          Container(
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
                    if (leadingIcon != null) NcSpacing.medium(),
                    label,
                  ],
                ),
                trailingIcon ?? Container(),
              ],
            ),
          ),
          NcSpacing.medium(),
          Expanded(child: body),
          NcSpacing.xs(),
        ],
      ),
      decoration: BoxDecoration(
        color: NcThemes.current.primaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(ncRadius),
        ),
        boxShadow: ncShadow,
      ),
    );
  }
}
