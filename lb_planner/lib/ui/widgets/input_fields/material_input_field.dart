import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

class NcMaterialInputField extends StatelessWidget {
  const NcMaterialInputField({Key? key, this.prefixIcon, this.placeholder, this.width, this.onValueChanged, this.obscureText = false, this.autoFocus = false, this.onSubmit}) : super(key: key);

  final Widget? prefixIcon;
  final String? placeholder;
  final double? width;
  final bool obscureText;
  final Function(String)? onSubmit;
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
        onSubmitted: onSubmit,
        style: NcBaseText.style(),
        cursorColor: NcThemes.current.accentColor,
        decoration: InputDecoration(
            prefixIcon: prefixIcon,
            hintText: placeholder,
            hintStyle: NcBaseText.style(),
            //labelText: placeholder,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            labelStyle: NcBaseText.style(),
            ////alignLabelWithHint: ,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: NcThemes.current.textColor),
            ),
            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: NcThemes.current.accentColor))),
      ),
    );
  }
}
