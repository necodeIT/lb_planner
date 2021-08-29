import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lb_planner/ui.dart';

// ignore: camel_case_types
class NcInputField extends StatelessWidget {
  const NcInputField({Key? key, this.prefixIcon, this.placeholder, this.width, this.onValueChanged, this.suffixIcon, this.primary = false, this.obscureText = false}) : super(key: key);

  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? placeholder;
  final bool obscureText;
  final bool? primary;
  final double? width;
  final Function(String)? onValueChanged;

  static const double height = 40;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: TextField(
        obscureText: obscureText,
        style: NcBodyText.baseStyle,
        onChanged: onValueChanged,
        keyboardType: TextInputType.text,
        cursorColor: NcThemes.current.accentColor,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          contentPadding: EdgeInsets.only(top: 10, left: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(ncRadius),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          hintStyle: NcBodyText.baseStyle,
          //hintStyle: TextStyle(color: NcThemes.current.textColor),

          hintText: placeholder,
          filled: true,
          fillColor: primary != true ? NcThemes.current.secondaryColor : NcThemes.current.primaryColor,
          prefixIcon: prefixIcon,
        ),
      ),
    );
  }
}
