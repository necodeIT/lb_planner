part of lbplanner_widgets;

/// Themed [Container] widget.
class LpContainer extends StatelessWidget {
  /// Themed [Container] widget.
  LpContainer({Key? key, this.title, this.leading, this.trailing, required this.child, this.width, this.height, this.spacing = false}) : super(key: key) {
    window = false;
  }

  /// Themed WindowContainer widget.
  LpContainer.window({Key? key, this.title, this.leading, this.trailing, required this.child, this.width, this.height, this.spacing = false}) : super(key: key) {
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
      duration: kFastAnimationDuration,
      padding: const EdgeInsets.all(NcSpacing.smallSpacing),
      decoration: BoxDecoration(
        color: primaryColor,
        boxShadow: kElevationToShadow[4],
        borderRadius: BorderRadius.circular(kRadius),
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
                duration: kFastAnimationDuration,
                padding: EdgeInsets.only(bottom: NcSpacing.smallSpacing),
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(kRadius)),
                ),
                child: child,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      if (leading != null) leading!,
                      if (leading != null) NcSpacing.small(),
                      if (title != null)
                        NcCaptionText(
                          title!,
                          fontSize: titleFontSize,
                        ),
                    ],
                  ),
                  if (trailing != null) trailing!,
                ],
              ),
            ),
            if (spacing) NcSpacing.small(),
            Expanded(child: child),
          ],
        ),
        child: child,
      ),
    );
  }
}
