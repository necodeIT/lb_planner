import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

class NcBox extends StatelessWidget {
  const NcBox({Key? key, required this.body, required this.label, this.leadingIcon, this.trailingIcon, this.width, this.height}) : super(key: key);

  final Widget label;
  final Widget body;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final double? width;
  final double? height;

  // static const BorderRadius borderRadius

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(25),
      child: Column(
        children: [
          Row(
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
          body
        ],
      ),
      decoration: BoxDecoration(
        color: NcThemes.current.primaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
    );
  }
}
