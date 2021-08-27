import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

// ignore: camel_case_types
class NcButton extends StatelessWidget {
  NcButton({Key? key, required this.text, required this.onTap, this.leadingIcon, this.trailingIcon, this.width}) : super(key: key) {
    this.cancel = false;
  }

  NcButton.cancel({Key? key, required this.text, required this.onTap, this.leadingIcon, this.trailingIcon, this.width}) : super(key: key) {
    this.cancel = true;
  }

  final Widget? leadingIcon;
  final Widget? trailingIcon;

  final String text;
  final Function() onTap;

  final double? width;
  late final bool cancel;

  @override
  Widget build(BuildContext context) {
    if (trailingIcon != null && leadingIcon != null) throw ArgumentError("Cannot have trailing icon and leading icon");

    return ElevatedButton(
      onPressed: onTap,
      child: Container(
        alignment: Alignment.centerLeft,
        height: 25,
        width: width,
        child: Row(
          mainAxisAlignment: trailingIcon != null
              ? MainAxisAlignment.spaceBetween
              : leadingIcon != null
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.center,
          // mainAxisSize: MainAxisSiz    e.min,
          children: [
            if (leadingIcon != null) leadingIcon ?? Container(),
            if (leadingIcon != null) NcSpacing.width(),
            Align(
              alignment: Alignment.centerLeft,
              child: NcTitleText(
                text,
                fontSize: 18,
                buttonText: true,
              ),
            ),
            trailingIcon ?? Container(),
          ],
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(cancel ? NcThemes.current.lateColor : NcThemes.current.accentColor),
        padding: MaterialStateProperty.all<EdgeInsets>(
          EdgeInsets.only(
            top: 15,
            bottom: 15,
            left: leadingIcon == null && trailingIcon == null ? 30 : 20,
            right: leadingIcon == null && trailingIcon == null ? 30 : 20,
          ),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7.0),
          ),
        ),
      ),
    );
  }
}
