part of lbplanner_widgets;

/// Themed [Icon] widget.
class LpIcon extends StatelessWidget {
  /// Themed [Icon] widget.
  const LpIcon(this.icon, {Key? key, this.size, this.color}) : super(key: key);

  /// Themed [Icon] widget with [size] set to 15
  // ignore: no-magic-number
  const LpIcon.contextMenu(this.icon, {Key? key, this.size = 15, this.color}) : super(key: key);

  /// The size of the icon.
  final double? size;

  /// The color of the icon.
  final Color? color;

  /// The icon to display.
  final IconData? icon;

  @override
  Widget build(BuildContext context) => Icon(icon, size: size, color: color ?? textColor);
}
