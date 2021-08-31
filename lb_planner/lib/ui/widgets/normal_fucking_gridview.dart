import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

class NcGridView extends StatelessWidget {
  NcGridView({Key? key, required this.children, this.spacing = NcSpacing.smallSpacing, EdgeInsetsGeometry? margin, Alignment? alignment}) : super(key: key) {
    this.margin = margin ?? EdgeInsets.all(ncShadow.first.blurRadius + NcSpacing.xsSpacing);
    this.alignment = alignment ?? Alignment.topLeft;
  }

  final List<Widget> children;
  final double spacing;
  late final EdgeInsetsGeometry margin;
  late final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: alignment,
        margin: margin,
        child: Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: children,
        ),
      ),
    );
  }
}
