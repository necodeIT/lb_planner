import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({Key? key, required this.icon, required this.placeholder, required this.margin, required this.width, this.onChanched, this.obscureText = false}) : super(key: key);
  final IconData icon;
  final String placeholder;
  final EdgeInsetsGeometry margin;
  final double width;
  final Function(String)? onChanched;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      // decoration: BoxShadow(color: Colors.black),
      width: width,
      height: 50,
      child: TextField(
        onChanged: (value) => onChanched!(value),
        textAlignVertical: TextAlignVertical.center,
        style: new TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            borderSide: BorderSide.none,
          ),
          filled: true,
          hintText: placeholder,
          prefixIcon: Icon(
            icon,
          ),
          isCollapsed: true,
        ),
        obscureText: obscureText,
      ),
    );
  }
}
