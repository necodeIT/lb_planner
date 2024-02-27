import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lb_planner/features/notifications/domain/providers/notifications_provider.dart';
import 'package:lb_planner/features/notifications/presentation/widgets/user_notifications_item.dart';
import 'package:lb_planner/shared/shared.dart';

/// Popup that displays all notifications the user received.
class UserNotificationsPopup extends StatefulWidget {
  /// Popup that displays all notifications the user received.
  const UserNotificationsPopup({Key? key, required this.close})
      : super(key: key);

  /// Callback to close the popup.
  final VoidCallback close;

  /// Popup that displays all notifications the user received.
  static UserNotificationsPopup builder(
          BuildContext context, VoidCallback close) =>
      UserNotificationsPopup(close: close);

  /// The width of the popup.
  static const double width = 350;

  /// The height of the popup.
  static const double height = 350;

  /// The max. age of the notifications to display.
  static const maxNotificationAge = Duration(days: 3);
  @override
  State<UserNotificationsPopup> createState() => _UserNotificationsPopupState();
}

class _UserNotificationsPopupState extends State<UserNotificationsPopup> {
  @override
  Widget build(context) {
    return Consumer(builder: (context, ref, _) {
      var notifications = ref.watch(notificationsProvider);

      notifications
          .sort((a, b) => b.createdAtTimestamp.compareTo(a.createdAtTimestamp));

      return LpContainer(
        spacing: true,
        leading: Text(
          t.user_notifications_notifications(notifications.length),
          style: TextStyle(
            fontWeight: FontWeight.w600,
            overflow: TextOverflow.ellipsis,
          ),
          textAlign: TextAlign.left,
        ),
        trailing: GestureDetector(
          onTap: () {
            ref.read(notificationsController).markAllAsRead();
          },
          child: Icon(
            Icons.close,
            color: context.theme.colorScheme.error,
          ),
        ),
        child: ConditionalWidget(
          condition: notifications.isNotEmpty,
          trueWidget: (context) => ListView(
            children: [
              for (var notification in notifications) ...[
                UserNotificationsItem(notificationId: notification.id),
                Spacing.small(),
              ]
            ],
          ),
          falseWidget: (context) =>
              VectorImage('assets/svg/notification.svg', width: 200),
        ),
        width: 350,
        height: 350,
      );
    });
  }
}

extension _NotificationExt on Notification {
  bool shouldDisplay(WidgetRef ref) {
    if (readTimestamp == null) return true;

    var invitePending = false;

    if (type.isInvite) {
      var invites = ref.watch(invitesProvider);
      var inviteId = payload;
      var invite = invites[inviteId];

      invitePending = invite != null && invite.status.isPending;
    }

    return DateTime.now().difference(readTimestamp!).inDays <
            UserNotificationsPopup.maxNotificationAge.inDays ||
        invitePending;
  }
}
