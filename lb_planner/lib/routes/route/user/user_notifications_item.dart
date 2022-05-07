part of lbplanner_routes;

/// User notifications item.
class UserNotificationsItem extends StatelessWidget {
  /// User notifications item.
  const UserNotificationsItem({Key? key, required this.notificationId}) : super(key: key);

  /// The notification to display.
  final int notificationId;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        var notification = ref.watch(notificationsProvider)[notificationId];

        String title = "";
        Widget actions = SizedBox.shrink();

        switch (notification.type) {
          case NotificationTypes.invite:
            // TODO: Handle this case.
            break;
          case NotificationTypes.inviteAccepted:
            // TODO: Handle this case.
            break;
          case NotificationTypes.inviteDeclined:
            // TODO: Handle this case.
            break;
          case NotificationTypes.planLeft:
            // TODO: Handle this case.
            break;
          case NotificationTypes.planRemoved:
            // TODO: Handle this case.
            break;
          case NotificationTypes.userRegistered:
            // TODO: Handle this case.
            break;
        }

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            NcBodyText(title),
            actions,
          ],
        );
      },
    );
  }
}
