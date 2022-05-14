part of lbplanner_routes;

/// Popup that displays all notifications the user received.
class UserNotificationsPopup extends LocalizedWidget {
  /// Popup that displays all notifications the user received.
  const UserNotificationsPopup({Key? key, required this.close}) : super(key: key);

  /// Callback to close the popup.
  final VoidCallback close;

  /// Popup that displays all notifications the user received.
  static UserNotificationsPopup builder(BuildContext context, VoidCallback close) => UserNotificationsPopup(close: close);

  /// The width of the popup.
  static const double width = 350;

  /// The height of the popup.
  static const double height = 350;

  /// The max. age of the notifications to display.
  static const maxNotificationAge = Duration(days: 7);

  /// The max. number of notifications to display as [DateTime].
  static get maxNotificationAgeAsDateTime => DateTime.now().subtract(maxNotificationAge);

  @override
  Widget create(BuildContext context, t) {
    return Consumer(builder: (context, ref, _) {
      var notifications = ref.watch(notificationsProvider).values.where((e) => e.shouldDisplay).toList();

      notifications.sort((a, b) => b.timestamp.compareTo(a.timestamp));

      return LpContainer(
        spacing: true,
        leading: NcCaptionText(t.user_notifications_notifications(notifications.length)),
        trailing: GestureDetector(
          onTap: close,
          child: LpIcon(
            Icons.close,
            color: errorColor,
          ),
        ),
        child: ConditionalWidget(
          condition: notifications.isNotEmpty,
          trueWidget: (context) => ListView(
            children: [
              for (var notification in notifications) ...[
                UserNotificationsItem(notificationId: notification.id),
                NcSpacing.small(),
              ]
            ],
          ),
          falseWidget: (context) => UniversalActor.fromRiveAnimation(animations_rive_newton),
        ),
        width: width,
        height: height,
      );
    });
  }
}

extension _NotificationExt on Notification {
  bool get shouldDisplay => timestamp.isAfter(UserNotificationsPopup.maxNotificationAgeAsDateTime) || type.isInvite;
}