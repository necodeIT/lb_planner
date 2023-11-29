import 'package:flutter/material.dart';
import 'package:lb_planner/shared/shared.dart';

/// Themed [Container] widget.
class LpContainer extends StatelessWidget {
  /// Themed [Container] widget.
  LpContainer(
      {Key? key,
      this.title,
      this.leading,
      this.trailing,
      required this.child,
      this.width,
      this.height,
      this.spacing = true})
      : super(key: key) {
    window = false;
  }

  /// Themed WindowContainer widget.
  LpContainer.window(
      {Key? key,
      this.title,
      this.leading,
      this.trailing,
      required this.child,
      this.width,
      this.height,
      this.spacing = false})
      : super(key: key) {
    window = true;
  }

  /// The title of the container.
  final String? title;

  /// The leading icon of the container.
  final Widget? leading;

  /// The trailing icon of the container.
  final Widget? trailing;

  /// The body of the container.
  final Widget child;

  /// The width of the container.
  final double? width;

  /// The height of the container.
  final double? height;

  /// If true, the container is a window.
  late final bool window;

  /// Spacing between the title and the body.
  final bool spacing;

  /// The font size of the title.
  static const titleFontSize = 19.0;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      padding: window
          ? EdgeInsets.only(bottom: Spacing.smallSpacing)
          : const EdgeInsets.all(Spacing.smallSpacing),
      decoration: BoxDecoration(
        color: context.theme.colorScheme.primary,
        boxShadow: kElevationToShadow[6],
        borderRadius: BorderRadius.circular(5),
      ),
      width: width,
      height: height,
      child: ConditionalWrapper(
        condition: title != null || leading != null || trailing != null,
        wrapper: (context, child) => Column(
          children: [
            ConditionalWrapper(
              condition: window,
              wrapper: (context, child) => AnimatedContainer(
                duration: Duration(milliseconds: 100),
                padding: EdgeInsets.only(
                    left: Spacing.smallSpacing, right: Spacing.smallSpacing),
                decoration: BoxDecoration(
                  color: context.theme.colorScheme.secondary,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(5)),
                ),
                child: child,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      if (leading != null) leading!,
                      if (leading != null) Spacing.small(),
                      if (title != null)
                        Text(
                          title!,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              overflow: TextOverflow.ellipsis,
                              fontSize: titleFontSize),
                          textAlign: TextAlign.left,
                        ),
                    ],
                  ),
                  if (trailing != null) trailing!,
                ],
              ),
            ),
            if (spacing) Spacing.small(),
            Expanded(child: child),
          ],
        ),
        child: child,
      ),
    );
  }