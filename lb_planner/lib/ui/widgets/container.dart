import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

class NcContainer extends StatelessWidget {
  NcContainer({Key? key, required this.label, required this.body, this.leadingIcon, this.trailingIcon, this.width, this.height, this.contentPadding = true, this.labelPadding = true}) : super(key: key) {
    window = false;
  }
  NcContainer.window({Key? key, required this.body, required this.label, this.leadingIcon, this.trailingIcon, this.width, this.height, this.contentPadding = true, this.labelPadding = true}) : super(key: key) {
    window = true;
  }

  final Widget label;
  final Widget body;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final double? width;
  final double? height;
  late final bool window;
  final bool contentPadding;
  final bool labelPadding;

  static const double padding = 15;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Column(
        children: [
          Container(
            padding: labelPadding ? EdgeInsets.all(padding) : null,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: window ? NcThemes.current.secondaryColor : null,
              borderRadius: window ? BorderRadius.only(topLeft: Radius.circular(ncRadius), topRight: Radius.circular(ncRadius)) : null,
            ),
            child: leadingIcon == null && trailingIcon == null
                ? label
                : Row(
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
          if (contentPadding) NcSpacing.xs(),
          Expanded(
            child: Container(
              padding: contentPadding ? EdgeInsets.only(left: padding, right: padding, bottom: padding) : EdgeInsets.only(bottom: padding),
              child: body,
            ),
          ),
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
