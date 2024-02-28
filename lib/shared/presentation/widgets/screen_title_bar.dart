import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:lb_planner/shared/shared.dart';
import 'package:lb_planner/features/auth/auth.dart';

/// Provides the title bar for a screen.
///
/// The title bar consits of the title of the screen and the user's profile picture and name.
///
/// See also:
///
/// - [Sidebar]
/// - [SidebarWrapperMixin]
class ScreenTitleBar extends ConsumerWidget {
  /// Provides the title bar for a screen.
  ///
  /// The title bar consits of the title of the screen and the user's profile picture and name.
  ///
  /// See also:
  ///
  /// - [Sidebar]
  /// - [SidebarWrapperMixin]
  const ScreenTitleBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);

    final currentRoute = context.router.current;

    // Go up two levels because every route is wrapped in a Root route
    final parent = currentRoute.parent?.parent;

    final titleStyle = Theme.of(context)
        .textTheme
        .headlineSmall
        ?.copyWith(fontWeight: FontWeight.bold);
    final iconSize = (titleStyle?.fontSize ?? 0) * 1.2;
    final profileImageSize = (titleStyle?.fontSize ?? 0) * 2;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: parent != null ? context.router.pop : null,
          child: Row(
            children: [
              if (parent != null)
                Icon(
                  Feather.arrow_left_circle,
                  size: iconSize,
                ),
              if (parent != null) const SizedBox(width: 10),
              Text(
                currentRoute.title(context),
                style: titleStyle,
              ),
            ],
          ),
        ),
        if (user != null)
          Row(
            children: [
              Icon(
                Icons.notifications_outlined,
                size: iconSize,
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: profileImageSize,
                height: profileImageSize,
                child: CircleAvatar(
                  // TODO: backgroundImage: fallback image
                  foregroundImage: NetworkImage(user.profileImageUrl),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${user.firstname} ${user.lastname}",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    // TODO: localization
                    user.capabilities.highest.name,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                ],
              ),
            ],
          ),
      ],
    );
  }
}
