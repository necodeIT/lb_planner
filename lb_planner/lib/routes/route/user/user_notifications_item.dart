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

        String text = notification.toString();
        List<Widget> actions = [];

        switch (notification.type) {
          case NotificationTypes.invite:
            text = t.user_notifications_invite_text(notification.payload["inviterid"].toString());
            actions = [
              LpTextButton(
                text: t.user_notifications_invite_accept,
                color: accentColor,
                decoration: TextDecoration.underline,
                onPressed: () {},
              ),
              LpTextButton(
                text: t.user_notifications_invite_decline,
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
            var user = ref.read(userProvider);

            text = t.user_notifications_userRegistered_text(user.firstname);

            actions = [
              LpTextButton(
                text: t.user_notifications_userRegistered_feedback,
                color: accentColor,
                decoration: TextDecoration.underline,
                // color: errorColor,
                onPressed: () => Navigator.of(context).pushReplacementNamed(SettingsRoute.routeName),
              ),
              LpTextButton(
                text: t.user_notifications_userRegistered_docs,
                color: accentColor,
                decoration: TextDecoration.underline,
                // color: errorColor,
                onPressed: () {},
              ),
            ];

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
                text,
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
