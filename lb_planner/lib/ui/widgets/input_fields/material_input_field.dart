import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

class NcMaterialInputField extends StatelessWidget {
  const NcMaterialInputField({
    Key? key,
    this.prefixIcon,
    this.placeholder,
    this.width,
    this.onValueChanged,
  }) : super(key: key);

  final Widget? prefixIcon;
  final String? placeholder;
  final double? width;
  final Function(String)? onValueChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 40,
      child: TextFormField(
        style: NcBodyText.baseStyle,
        initialValue: 'Input text',
        decoration: InputDecoration(
            prefixIcon: prefixIcon,
            hintText: placeholder,
            hintStyle: NcBodyText.baseStyle,
            //labelText: placeholder,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            labelStyle: NcBodyText.baseStyle,
            //alignLabelWithHint: ,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: NcThemes.current.textColor),
            ),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: NcThemes.current.accentColor))),
      ),
    );
  }
}
