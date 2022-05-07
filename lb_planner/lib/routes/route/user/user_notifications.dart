part of lbplanner_routes;

/// Popup that displays all notifications the user received.
class UserNotifications extends StatefulWidget {
  /// Popup that displays all notifications the user received.
  const UserNotifications({Key? key}) : super(key: key);

  @override
  State<UserNotifications> createState() => _UserNotificationsState();
}

class _UserNotificationsState extends State<UserNotifications> {
  bool _isShowing = false;

  void _onShow(NotificationsProvider notificationsProvider) {
    setState(() {
      _isShowing = true;
    });

    notificationsProvider.markAllAsRead();
  }

  void _onHide() {
    setState(() {
      _isShowing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        var notifications = _isShowing ? ref.read(notificationsProvider) : ref.watch(notificationsProvider);

        var child = LpPopup(
          onShow: () => _onShow(ref.read(notificationsController)),
          onHide: _onHide,
          child: LpIcon(Icons.notifications_outlined),
          popupBuilder: UserNotificationsPopup.builder,
          offset: const Offset(-10, 0),
        );

        return ConditionalWrapper(
          condition: notifications.values.any((notification) => notification.status == NotificationStatus.unread),
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
