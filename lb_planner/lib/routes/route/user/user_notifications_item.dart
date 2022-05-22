part of lbplanner_routes;

/// User notifications item.
class UserNotificationsItem extends LocalizedWidget {
  /// User notifications item.
  const UserNotificationsItem({Key? key, required this.notificationId}) : super(key: key);

  /// The notification to display.
  final int notificationId;

  /// Fontsize actions labels.
  static const double actionsFontSize = 14;

  /// Formatter for the date.
  static final formatter = DateFormat.MMMEd();

  @override
  Widget build(context, t) {
    return Consumer(
      builder: (context, ref, _) {
        var notification = ref.watch(notificationsProvider)[notificationId]!;

        String text = notification.toString();
        List<_Action> actions = [];
        bool loading = false;

        switch (notification.type) {
          case NotificationTypes.invite:
            int inviterId = notification.payload["inviterid"];

            var inviter = ref.watch(usersProvider)[inviterId];

            if (inviter == null) {
              loading = true;
              break;
            }

            text = t.user_notifications_invite_text(inviter.fullname);

            // var invite = ref.watch(invitesProvider).values.where((invite) => invite.inviter == inviterId);

            actions = [
              // if (invite.status.isPending)
              // if (invite.isNotEmpty)
              _Action(
                text: t.user_notifications_invite_accept,
                onPressed: () {},
              ),
              // if (invite.status.isPending)
              // if (invite.isNotEmpty)
              _Action(
                text: t.user_notifications_invite_decline,
                onPressed: () {},
              ),
              // if (!invite.status.isPending)
              //   _Action(
              //     text: invite.status.isAccepted ? "Accepted" : "Declined",
              //   ),
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
              _Action(
                text: t.user_notifications_userRegistered_docs,
                onPressed: () {},
              ),
            ];

            break;
        }

        return ConditionalWidget(
          condition: loading,
          trueWidget: (context) => LpShimmer(),
          falseWidget: (context) => Container(
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
                NcSpacing.small(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        LpIcon(
                          Icons.access_time,
                          size: actionsFontSize,
                          // ignore: no-magic-number
                          color: textColor.withOpacity(.7),
                        ),
                        NcSpacing.xs(),
                        NcCaptionText(
                          timeago.format(notification.timestamp),
                          // ignore: no-magic-number
                          color: textColor.withOpacity(.7),
                          fontSize: actionsFontSize,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        for (var action in actions) action.build(context),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class _Action {
  final String text;
  final VoidCallback? onPressed;

  _Action({required this.text, this.onPressed});

  Widget build(BuildContext context) {
    return ConditionalWidget(
      condition: onPressed != null,
      trueWidget: (_) => LpTextButton(
        text: text,
        color: accentColor,
        decoration: TextDecoration.underline,
        fontSize: UserNotificationsItem.actionsFontSize,
        onPressed: onPressed,
      ),
      falseWidget: (_) => NcCaptionText(
        text,
        // ignore: no-magic-number
        color: textColor.withOpacity(.7),
        fontSize: UserNotificationsItem.actionsFontSize,
      ),
    );
  }
}
