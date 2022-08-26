part of lbplanner_widgets;

/// [GestureDetector] with default app settings.
class LpGestureDetector extends StatelessWidget {
  /// [GestureDetector] with default app settings.
  const LpGestureDetector({Key? key, this.onTap, this.onLongPress, this.onDoubleTap, this.child, this.cursor = SystemMouseCursors.click}) : super(key: key);

  /// [GestureDetector.onTap]
  final VoidCallback? onTap;

  /// [GestureDetector.onLongPress]
  final VoidCallback? onLongPress;

  /// [GestureDetector.onDoubleTap]
  final VoidCallback? onDoubleTap;

  /// [GestureDetector.child]
  final Widget? child;

  /// The cursor to display when the user is hovering over the widget.
  final MouseCursor cursor;

  @override
  Widget build(BuildContext context) {
    return ConditionalWrapper(
      condition: onTap != null || onLongPress != null || onDoubleTap != null,
      wrapper: (context, child) => MouseRegion(
        child: child,
        cursor: cursor,
      ),
      child: GestureDetector(
        onTap: onTap,
        onLongPress: onLongPress,
        onDoubleTap: onDoubleTap,
        child: child,
      ),
    );
  }
}
