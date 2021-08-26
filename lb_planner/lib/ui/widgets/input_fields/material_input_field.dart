import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

class NcMaterialInputField extends StatelessWidget {
  const NcMaterialInputField({Key? key, this.leadingIcon, this.placeholder, this.width, this.onValueChanged, this.suffixIcon}) : super(key: key);

  final Widget? leadingIcon;
  final Widget? suffixIcon;
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
          //wenn Icon da -13, wenn ne dann -23 -> Benjo
          contentPadding: leadingIcon != null ? const EdgeInsets.only(top: -13.0) : const EdgeInsets.only(top: -23.0),
          prefixIcon: leadingIcon,
          labelText: placeholder,
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
