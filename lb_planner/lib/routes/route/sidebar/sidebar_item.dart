part of lbplanner_routes;

/// Navigation button for the sidebar.
class SidebarItem extends StatelessWidget {
  /// Navigation button for the sidebar.
  const SidebarItem({Key? key, required this.icon, required this.route, this.onTap, this.routes = const []}) : super(key: key);

  /// The icon to display
  final IconData icon;

  /// Whether the item is selected
  final String route;

  /// Routes that also actiavte the sidebar item.
  final List<String> routes;

  /// Called when the item is tapped.
  final VoidCallback? onTap;

  /// The size of the icon.
  static const double iconSize = 20;

  /// The size of the item.
  static const double size = 35;

  /// Radius of the item.
  static const double radius = 10;

  @override
  Widget build(BuildContext context) {
    var selected = currentRoute == route || routes.contains(currentRoute);

    return HoverBuilder(
      onTap: () {
        if (selected) return;

        onTap?.call();
        Navigator.pushReplacementNamed(context, route);
      },
      builder: (context, hover) => AnimatedContainer(
        duration: kFastAnimationDuration,
        curve: Curves.ease,
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: selected ? accentColor : secondaryColor,
          boxShadow: kElevationToShadow[selected || hover ? 3 : 0],
        ),
        child: LpIcon(
          icon,
          color: selected ? buttonTextColor : textColor,
          size: iconSize,
        ),
      ),
    );
  }
}
