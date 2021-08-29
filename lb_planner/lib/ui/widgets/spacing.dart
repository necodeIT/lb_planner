import 'package:flutter/material.dart';

class NcSpacing extends StatelessWidget {
  NcSpacing.xs({Key? key}) : super(key: key) {
    spacing = xsSpacing;
  }

  NcSpacing.small({Key? key}) : super(key: key) {
    spacing = smallSpacing;
  }

  NcSpacing.medium({Key? key}) : super(key: key) {
    spacing = mediumSpacing;
  }

  NcSpacing.large({Key? key}) : super(key: key) {
    spacing = largeSpacing;
  }

  NcSpacing.xl({Key? key}) : super(key: key) {
    spacing = xlSpacing;
  }

  static const double xsSpacing = 5;
  static const double smallSpacing = 10;
  static const double mediumSpacing = 20;
  static const double largeSpacing = 25;
  static const double xlSpacing = 30;

  late final double spacing;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: spacing, height: spacing);
  }
}
