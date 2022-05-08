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

  @override
  Widget create(BuildContext context, t) {
    return Consumer(builder: (context, ref, _) {
      var notifications = ref.watch(notificationsProvider);

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
              for (var notification in notifications.values) ...[
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
