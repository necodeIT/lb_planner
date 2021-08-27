import 'package:flutter/material.dart';

class NcSpacing extends StatelessWidget {
  NcSpacing.all({Key? key}) : super(key: key) {
    width = spacing;
    height = spacing;
  }

  NcSpacing.hieght({Key? key}) : super(key: key) {
    height = spacing;
  }

  NcSpacing.width({Key? key}) : super(key: key) {
    width = spacing;
  }

  static const double spacing = 10;

  late final double width;
  late final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: spacing, height: spacing);
  }
}
