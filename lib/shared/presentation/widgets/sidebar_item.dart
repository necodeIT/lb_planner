import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lb_planner/shared/shared.dart';

/// An item in the sidebar.
///
/// When tapped, the [route] will be pushed.
/// When the [route] is active, this item will be selected.
class SidebarItem extends StatelessWidget {
  /// An item in the sidebar.
  ///
  /// When tapped, the [route] will be pushed.
  /// When the [route] is active, this item will be selected.
  const SidebarItem({
    super.key,
    required this.route,
    required this.icon,
    this.onTap,
  });

  /// The route that must be active for this item to be selected.
  ///
  /// When this is tapped, the route will be pushed.
  final PageRouteInfo<dynamic> route;

  /// The icon to use for the route.
  final IconData icon;

  /// The callback when this item is tapped.
  ///
  /// This is used, as the logout button is also in the side bar and should look the same, as to reduce code duplication.
  ///
  /// Note:
  /// - Navigation is handled **after** the callback has finished, so don't call any heavy functions in this callback
  /// - [onTap] is only called when the route is not active
  final FutureOr<void> Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final match = context.router.match(route)!;

    final selected = context.router.isPathActive(match.path);

    const double size = 35;
    const double iconSize = 20;

    final colorScheme = Theme.of(context).colorScheme;

    return HoverBuilder(
      onTap: () async {
        if (selected) return;

        if (onTap != null) await onTap!();

        context.navigateTo(route);
      },
      builder: (context, hover) => AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: selected ? colorScheme.primary : colorScheme.background,
          // ignore: no-magic-number
          boxShadow: kElevationToShadow[selected || hover ? 3 : 0],
        ),
        child: Icon(
          icon,
          color: selected ? colorScheme.onPrimary : null,
          size: iconSize,
        ),
      ),
    );
  }
}
