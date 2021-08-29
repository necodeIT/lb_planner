import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

class NcMaterialInputField extends StatelessWidget {
  const NcMaterialInputField({Key? key, this.prefixIcon, this.placeholder, this.width, this.onValueChanged, this.obscureText = false, this.autoFocus = false}) : super(key: key);

  final Widget? prefixIcon;
  final String? placeholder;
  final double? width;
  final bool obscureText;
  final bool autoFocus;
  final Function(String)? onValueChanged;

  static const double height = 40;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: TextField(
        autofocus: autoFocus,
        obscureText: obscureText,
        onChanged: onValueChanged,
        style: NcBodyText.baseStyle,
        decoration: InputDecoration(
            prefixIcon: prefixIcon,
            hintText: placeholder,
            hintStyle: NcBodyText.baseStyle,
            //labelText: placeholder,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            labelStyle: NcBodyText.baseStyle,
            ////alignLabelWithHint: ,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: NcThemes.current.textColor),
            ),
            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: NcThemes.current.accentColor))),
      ),
    );
  }
}
