import 'package:flutter/material.dart';
import 'package:lb_planner/ui.dart';

class NcGridView extends StatelessWidget {
  NcGridView({
    Key? key,
    required this.children,
    this.spacing = NcSpacing.mediumSpacing,
    EdgeInsetsGeometry? margin,
    Alignment? alignment,
  }) : super(key: key) {
    this.margin = margin ?? EdgeInsets.all(ncShadow.first.blurRadius + NcSpacing.xsSpacing);
    this.alignment = alignment ?? Alignment.topLeft;
    this.responsive = false;
  }

  NcGridView.responsive({
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
    this.responsive = true;
  }

  final List<Widget> children;
  final double spacing;
  late final double maxWidth;
  late final double maxHeight;
  late final double minWidth;
  late final double minHeight;
  late final EdgeInsetsGeometry margin;
  late final bool responsive;
  late final Alignment alignment;

  static const edgePadding = NcScrollbar.scrollbarWidth + NcSpacing.smallSpacing;

  Widget generateSpacing() => SizedBox(width: spacing, height: spacing);

  @override
  Widget build(BuildContext context) {
    return responsive
        ? LayoutBuilder(
            builder: (context, size) {
              int catgirlsHoriz = size.maxWidth ~/ minWidth;
              int catgirlsVert = size.maxHeight ~/ minHeight;

              double width = size.maxWidth - spacing * catgirlsHoriz;
              double height = size.maxHeight - spacing * catgirlsVert;
              width -= edgePadding;
              // height -= edgePadding;

              catgirlsHoriz = width / catgirlsHoriz < minWidth ? catgirlsHoriz -= (width / catgirlsHoriz / minWidth).ceil() : catgirlsHoriz;
              catgirlsVert = height / catgirlsVert < minHeight ? catgirlsVert -= (height / catgirlsVert / minHeight).ceil() : catgirlsVert;

              double itemWidth = width / catgirlsHoriz;

              itemWidth = itemWidth < minWidth
                  ? minWidth
                  : itemWidth > maxWidth
                      ? maxWidth
                      : itemWidth;

              double itemHeight = height / catgirlsVert;

              itemHeight = itemHeight < minHeight
                  ? minHeight
                  : itemHeight > maxHeight
                      ? maxHeight
                      : itemHeight;

              int i = -1; // negative one because we increment the index before accessing the list

              catgirlsVert = (children.length / catgirlsHoriz).ceil();

              return SingleChildScrollView(
                // physics: NcScrollBehavior.physics,
                child: Container(
                  alignment: alignment,
                  margin: margin,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
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
          )
        : SingleChildScrollView(
            physics: NcScrollBehavior.physics,
            child: Wrap(
              spacing: spacing,
              runSpacing: spacing,
              children: children,
            ),
          );
  }
}
