import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

class NcBox extends StatelessWidget {
  const NcBox({Key? key, required this.label, this.leadingIcon, this.trailingIcon, this.width, this.height}) : super(key: key);

  final Widget label;
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
