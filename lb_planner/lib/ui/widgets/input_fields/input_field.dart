import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lb_planner/ui.dart';

// ignore: camel_case_types
class NcInputField extends StatelessWidget {
  const NcInputField(
      {Key? key,
      this.leadingIcon,
      required this.text,
      this.width,
      required this.onValueChanged})
      : super(key: key);

  final Widget? leadingIcon;
  final String text;
  final double? width;
  final Function(String) onValueChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 40,
      child: TextField(
        style: NcBodyText.baseStyle,
        onChanged: onValueChanged,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          hintStyle: NcBodyText.baseStyle,
          //hintStyle: TextStyle(color: NcThemes.current.textColor),

          hintText: text,
          filled: true,
          fillColor: NcThemes.current.primaryColor,
          prefixIcon: leadingIcon,
        ),
      ),
    );
  }
}
