import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lb_planner/ui.dart';

class NcInputField2 extends StatelessWidget {
  const NcInputField2(
      {Key? key,
      this.leadingIcon,
      required this.text,
      this.width,
      required this.onValueChanged,
      this.suffixIcon})
      : super(key: key);

  final Widget? leadingIcon;
  final Widget? suffixIcon;
  final String text;
  final double? width;
  final Function(String) onValueChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 40,
      child: TextFormField(
        style: NcBodyText.baseStyle,
        initialValue: 'Input text',
        decoration: InputDecoration(
          //wenn Icon da -13, wenn ne dann -23 -> Benjo
          contentPadding: const EdgeInsets.only(top: -23.0),
          prefixIcon: leadingIcon,
          labelText: text,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelStyle: NcBodyText.baseStyle,
          //alignLabelWithHint: ,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: NcThemes.current.accentColor),
          ),
        ),
      ),
    );
  }
}
