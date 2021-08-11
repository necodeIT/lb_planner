import 'package:flutter/material.dart';
import 'package:lb_planner/extensions/color.dart';

class DefaultGradient extends StatelessWidget {
  const DefaultGradient({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            HexColor.fromHex("#362F3F"),
            HexColor.fromHex("#282A2E"),
            HexColor.fromHex("#353550"),
          ],
        ),
      ),
      child: child,
    );
  }
}
