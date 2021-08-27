import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

class NcConfirmDialog extends StatelessWidget {
  NcConfirmDialog({ Key? key, required this.label, required this.body, required this.button, this.secbutton, this.leadingIcon, this.trailingIcon}) : super(key: key){
    window=false;
  }
  NcConfirmDialog.window({ Key? key, required this.label, required this.body, required this.button, this.secbutton, this.leadingIcon, this.trailingIcon}) : super(key: key){
    window=true;
  }

  final Widget label;
  final Widget body;
  final Widget button;
  final Widget? secbutton;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  late final bool window;

  static const double radius = 10;
  static const double padding = 10;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(

      title: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: padding, left: padding, bottom: padding),
            decoration: BoxDecoration(
              color: window ? NcThemes.current.secondaryColor : null,
              borderRadius: window ? BorderRadius.only(topLeft: Radius.circular(radius), topRight: Radius.circular(radius)) : null,
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
        ]
      ),

      content: body,
      actions: <Widget>[button, secbutton ?? Container()],
      backgroundColor: NcThemes.current.primaryColor,
      buttonPadding: EdgeInsets.symmetric(horizontal: 4, vertical: 3),
      contentPadding: EdgeInsets.symmetric(horizontal: 4, vertical: 3),
    );
  }
}