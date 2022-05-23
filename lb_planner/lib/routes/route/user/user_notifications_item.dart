part of lbplanner_routes;

/// User notifications item.
class UserNotificationsItem extends StatefulWidget {
  /// User notifications item.
  const UserNotificationsItem({Key? key, required this.notificationId}) : super(key: key);

  /// The notification to display.
  final int notificationId;

  /// Fontsize actions labels.
  static const double actionsFontSize = 14;

  /// Formatter for the date.
  static final formatter = DateFormat.MMMEd();

  @override
  State<UserNotificationsItem> createState() => _UserNotificationsItemState();
}

class _UserNotificationsItemState extends State<UserNotificationsItem> {
  Future? _future;

  void load(Future future) {
    setState(() {
      _future = future;
    });
  }

  @override
  Widget build(context) {
    return Consumer(
      builder: (context, ref, _) {
        var notification = ref.watch(notificationsProvider)[widget.notificationId]!;

        String text = notification.toString();
        List<_Action> actions = [];
        bool loading = false;

        switch (notification.type) {
          case NotificationTypes.invite:
            int id = notification.payload["inviteid"];

            var invite = ref.watch(invitesProvider)[id];

            if (invite == null) {
              loading = true;
              break;
            }

            var controller = ref.read(invitesController);

            var inviter = ref.watch(usersProvider)[invite.inviter]!;

            text = t.user_notifications_invite_text(inviter.fullname);

            actions = [
              if (invite.status.isPending && _future == null)
                _Action(
                  text: t.user_notifications_invite_accept,
                  onPressed: () => load(controller.acceptInvite(invite.id)),
                ),
              if (invite.status.isPending && _future == null)
                _Action(
                  text: t.user_notifications_invite_decline,
                  onPressed: () => load(controller.declineInvite(invite.id)),
                ),
              if (!invite.status.isPending)
                _Action(
                  text: invite.status.isAccepted ? t.user_notifications_invite_accepted : t.user_notifications_invite_declined,
                  loading: _future != null,
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
                          size: UserNotificationsItem.actionsFontSize,
                          // ignore: no-magic-number
                          color: textColor.withOpacity(.7),
                        ),
                        NcSpacing.xs(),
                        NcCaptionText(
                          timeago.format(notification.timestamp),
                          // ignore: no-magic-number
                          color: textColor.withOpacity(.7),
                          fontSize: UserNotificationsItem.actionsFontSize,
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
  final bool loading;

  _Action({required this.text, this.onPressed, this.loading = false});

  Widget build(BuildContext context) {
    return ConditionalWidget(
      condition: loading,
      trueWidget: (context) => LpLoadingIndicator.circular(),
      falseWidget: (context) => ConditionalWidget(
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
      ),
    );
  }
}
