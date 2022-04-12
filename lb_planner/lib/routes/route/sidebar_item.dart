part of lbplanner_routes;

/// Navigation button for the sidebar.
class SidebarItem extends StatelessWidget {
  /// Navigation button for the sidebar.
  const SidebarItem({Key? key, required this.icon, required this.route, this.onTap}) : super(key: key);

  /// The icon to display
  final IconData icon;

  /// Whether the item is selected
  final String route;

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
    var value = currentRoute == route;

    return HoverBuilder(
      onTap: () {
        onTap?.call();
        Navigator.pushNamed(context, route);
      },
      builder: (context, hover) => AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        curve: Curves.ease,
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: value ? accentColor : secondaryColor,
          boxShadow: kElevationToShadow[value || hover ? 3 : 0],
        ),
        child: LpIcon(
          icon,
          color: value ? buttonTextColor : textColor,
          size: iconSize,
        ),
      ),
    );
  }
}
