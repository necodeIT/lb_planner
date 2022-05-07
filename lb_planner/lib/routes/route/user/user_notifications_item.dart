part of lbplanner_routes;

/// User notifications item.
class UserNotificationsItem extends LocalizedWidget {
  /// User notifications item.
  const UserNotificationsItem({Key? key, required this.notificationId}) : super(key: key);

  /// The notification to display.
  final int notificationId;

  @override
  Widget create(BuildContext context, t) {
    return Consumer(
      builder: (context, ref, _) {
        var notification = ref.watch(notificationsProvider)[notificationId]!;

        String title = notification.toString();
        List<Widget> actions = [];

        switch (notification.type) {
          case NotificationTypes.invite:
            title = t.user_notifications_invite_text(notification.payload["inviterid"].toString());
            actions = [
              LpTextButton(
                text: t.user_notifications_invite_accept_text,
                color: accentColor,
                decoration: TextDecoration.underline,
                onPressed: () {},
              ),
              LpTextButton(
                text: t.user_notifications_invite_decline_text,
                color: accentColor,
                decoration: TextDecoration.underline,
                // color: errorColor,
                onPressed: () {},
              ),
            ];
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

        return Container(
          padding: EdgeInsets.all(NcSpacing.smallSpacing),
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.circular(kRadius),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NcCaptionText(
                title,
                overflow: TextOverflow.visible,
              ),
              if (actions.isNotEmpty) NcSpacing.small(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: actions,
              ),
            ],
          ),
        );
      },
    );
  }
}
