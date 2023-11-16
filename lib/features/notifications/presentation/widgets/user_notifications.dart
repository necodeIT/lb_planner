import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lb_planner/features/notifications/notifications.dart';
import 'package:lb_planner/features/notifications/presentation/widgets/widgets.dart';
import 'package:lb_planner/shared/shared.dart';

/// Popup that displays all notifications the user received.
class UserNotifications extends ConsumerStatefulWidget {
  /// Popup that displays all notifications the user received.
  const UserNotifications({Key? key}) : super(key: key);

  @override
  ConsumerState<UserNotifications> createState() => _UserNotificationsState();
}

class _UserNotificationsState extends ConsumerState<UserNotifications> {
  bool _isShowing = false;

  void _onShow(NotificationsProviderState read) {
    setState(() {
      _isShowing = true;
    });

    read.markAllAsRead();
  }

  void _onHide() {
    setState(() {
      _isShowing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var notifications = _isShowing
        ? ref.read(notificationsProvider)
        : ref.watch(notificationsProvider);

    var child = Popup(
      onShow: () => _onShow(ref.read(notificationsController)),
      onHide: _onHide,
      child: Icon(Icons.notifications_outlined),
      hoverChild:
          Icon(Icons.notifications_outlined, color: context.theme.primaryColor),
      popupBuilder: UserNotificationsPopup.builder,
      offset: const Offset(-10, 0),
    );

    return ConditionalWrapper(
      condition: notifications.any((notification) => !notification.read),
      wrapper: (context, child) => Badge(
        alignment: AlignmentDirectional.bottomEnd,
        // position: BadgePosition.bottomEnd(bottom: -2, end: -2),
        child: child,
        backgroundColor: context.theme.primaryColor,
      ),
      child: child,
    );
  }
}
