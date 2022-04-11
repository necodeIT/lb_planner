part of lbplanner_widgets;

/// Themed [Icon] widget.
class LpIcon extends StatelessWidget {
  /// Themed [Icon] widget.
  const LpIcon(this.icon, {Key? key, this.size, this.color}) : super(key: key);

  /// The size of the icon.
  final double? size;

  /// The color of the icon.
  final Color? color;

  /// The icon to display.
  final IconData? icon;

  @override
  Widget build(BuildContext context) => Icon(icon, size: size, color: color ?? textColor);
}
