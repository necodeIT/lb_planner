import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

class NcGridView extends StatelessWidget {
  NcGridView({
    Key? key,
    required this.children,
    this.spacing = NcSpacing.mediumSpacing,
    EdgeInsetsGeometry? margin,
    Alignment? alignment,
    this.maxWidth = double.infinity,
    this.maxHeight = double.infinity,
    required this.minWidth,
    required this.minHeight,
  }) : super(key: key) {
    this.margin = margin ?? EdgeInsets.all(ncShadow.first.blurRadius + NcSpacing.xsSpacing);
    this.alignment = alignment ?? Alignment.topLeft;
  }

  final List<Widget> children;
  final double spacing;
  final double maxWidth;
  final double maxHeight;
  final double minWidth;
  final double minHeight;
  late final EdgeInsetsGeometry margin;
  late final Alignment alignment;

  // static const edgePadding = NcScrollbar.scrollbarWidth + NcSpacing.smallSpacing;
  static const edgePadding = 0;

  Widget generateSpacing() => SizedBox(width: spacing, height: spacing);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, size) {
        int catgirlsHoriz = size.maxWidth ~/ minWidth;
        int catgirlsVert = size.maxHeight ~/ minHeight;

        double width = size.maxWidth - spacing * catgirlsHoriz;
        double height = size.maxHeight - spacing * catgirlsVert;
        width -= edgePadding;
        height -= edgePadding;

        catgirlsHoriz = width / catgirlsHoriz < minWidth ? catgirlsHoriz -= (width / catgirlsHoriz / minWidth).ceil() : catgirlsHoriz;
        catgirlsVert = width / catgirlsVert < minHeight ? catgirlsVert -= (height / catgirlsVert / minHeight).ceil() : catgirlsVert;

        double itemWidth = width / catgirlsHoriz;

        itemWidth = itemWidth < minWidth
            ? minWidth
            : itemWidth > maxWidth
                ? maxWidth
                : itemWidth;

        double itemHeight = height;

        itemHeight = itemHeight < minHeight
            ? minHeight
            : itemHeight > maxHeight
                ? maxHeight
                : itemHeight;

        int i = -1; // negative one because we increment the index before accessing the list

        catgirlsVert = MediaQuery.of(context).size.height ~/ itemHeight;

        return SingleChildScrollView(
          physics: NcScrollBehavior.physics,
          child: Container(
            alignment: alignment,
            margin: margin,
            child: Column(
              children: [
                for (int h = 0; h < catgirlsVert; h++)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (h != 0) generateSpacing(),
                      Row(
                        children: [
                          for (int j = 0; j < catgirlsHoriz; j++)
                            Builder(
                              builder: (context) {
                                i++;

                                return i < children.length // checking bounds cause idk flutter is yelling at me
                                    ? Row(
                                        children: [
                                          if (j != 0) generateSpacing(),
                                          Container(
                                            width: itemWidth,
                                            height: itemHeight,
                                            child: children[i],
                                          ),
                                        ],
                                      )
                                    : Container();
                              },
                            )
                        ],
                      ),
                    ],
                  )
              ],
            ),
          ),
        );
      },
    );
  }
}
