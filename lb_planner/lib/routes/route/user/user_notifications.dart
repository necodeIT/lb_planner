part of lbplanner_routes;

/// Popup that displays all notifications the user received.
class UserNotifications extends StatelessWidget {
  /// Popup that displays all notifications the user received.
  const UserNotifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        var notifications = ref.watch(notificationsProvider);
        var controller = ref.read(notificationsController);

        var child = LpPopup(
          onShow: () => controller.markAllAsRead(),
          child: LpIcon(Icons.notifications_outlined),
          popupBuilder: UserNotificationsPopup.builder,
          offset: const Offset(-10, 0),
        );

        return ConditionalWrapper(
          condition: notifications.any((notification) => notification.status == NotificationStatus.unread),
          wrapper: (context, child) => Badge(
            child: child,
            badgeColor: accentColor,
            position: BadgePosition.bottomEnd(bottom: -2, end: -2),
            // animationType: BadgeAnimationType.fade,
            // animationDuration: kFasterAnimationDuration,
          ),
          child: child,
        );
      },
    );
  }
}
