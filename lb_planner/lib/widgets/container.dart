part of lbplanner_widgets;

/// Themed [Container] widget.
class LpContainer extends StatelessWidget {
  /// Themed [Container] widget.
  LpContainer({Key? key, required this.title, this.leadingIcon, this.trailingIcon, required this.body, this.width, this.height}) : super(key: key) {
    window = false;
  }

  /// Themed WindowContainer widget.
  LpContainer.window({Key? key, required this.title, this.leadingIcon, this.trailingIcon, required this.body, this.width, this.height}) : super(key: key) {
    window = true;
  }

  /// The title of the container.
  final String title;

  /// The leading icon of the container.
  final Widget? leadingIcon;

  /// The trailing icon of the container.
  final Widget? trailingIcon;

  /// The body of the container.
  final Widget body;

  /// The width of the container.
  final double? width;

  /// The height of the container.
  final double? height;

  /// If true, the container is a window.
  late final bool window;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Column(
        children: [
          ConditionalWrapper(
            condition: window,
            wrapper: (context, child) => Container(
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
                    if (leadingIcon != null) leadingIcon!,
                    if (leadingIcon != null) NcSpacing.small(),
                    NcTitleText(title),
                  ],
                ),
                if (trailingIcon != null) trailingIcon!,
              ],
            ),
          ),
          body,
        ],
      ),
    );
  }
}
