part of lbplanner_routes;

/// User notifications item.
class UserNotificationsItem extends StatefulWidget {
  /// User notifications item.
  const UserNotificationsItem({Key? key, required this.notificationId})
      : super(key: key);

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

  void load(List<Future> tasks) async {
    setState(() {
      _future = Future.wait(tasks);
    });

    await _future;

    if (!mounted) return;

    setState(() {
      _future = null;
    });
  }

  @override
  Widget build(context) {
    return Consumer(
      builder: (context, ref, _) {
        var notification =
            ref.watch(notificationsProvider)[widget.notificationId]!;

        String text = notification.toString();
        List<_Action> actions = [];
        bool loading = false;

        switch (notification.type) {
          case NotificationTypes.invite:
            int id = notification.payload!;

            var invite = ref.watch(invitesProvider)[id];

            if (invite == null) {
              loading = true;
              break;
            }

            var controller = ref.read(invitesController);

            var inviter = ref.watch(usersProvider)[invite.inviter];

            var plan = ref.watch(planProvider);

            if (inviter == null) {
              loading = true;
              break;
            }

            text = t.user_notifications_invite_text(inviter.fullname);

            actions = [
              if (invite.status.isPending && _future == null)
                _Action(
                  text: t.user_notifications_invite_accept,
                  onPressed: () {
                    void action() {
                      load(
                        [
                          controller.acceptInvite(invite.id),
                          ref.read(planController).fetchPlan(),
                        ],
                      );
                    }

                    if (plan.deadlines.isEmpty) return action();

                    lpShowConfirmDialog(
                      context,
                      title: t.user_notifications_invite_accept_confirm_title,
                      message: t.user_notifications_invite_accept_confirm_body,
                      confirmIsBad: true,
                      onConfirm: action,
                    );
                  },
                ),
              if (invite.status.isPending && _future == null)
                _Action(
                  text: t.user_notifications_invite_decline,
                  onPressed: () => load([controller.declineInvite(invite.id)]),
                ),
              if (!invite.status.isPending)
                _Action(
                  text: invite.status.isExpired
                      ? t.user_notifications_invite_expired
                      : invite.status.isAccepted
                          ? t.user_notifications_invite_accepted
                          : t.user_notifications_invite_declined,
                  loading: _future != null,
                ),
            ];

            break;
          case NotificationTypes.inviteAccepted:
            var id = notification.payload;

            var invite = ref.watch(invitesProvider)[id];

            if (invite == null) {
              loading = true;
              break;
            }

            var user = ref.watch(usersProvider)[invite.invitee];

            if (user == null) {
              loading = true;
              break;
            }

            text = t.user_notifications_inviteAccepted_text(user.fullname);
            break;
          case NotificationTypes.inviteDeclined:
            var id = notification
                .payload; // dunno why but "inviteid" is appearently a string

            var invite = ref.watch(invitesProvider)[id];

            if (invite == null) {
              loading = true;
              break;
            }

            var user = ref.watch(usersProvider)[invite.invitee];

            if (user == null) {
              loading = true;
              break;
            }

            text = t.user_notifications_inviteDeclined_text(user.fullname);

            break;
          case NotificationTypes.planLeft:
            var userid = notification.payload;
            var users = ref.watch(usersProvider);

            var user = users[userid];

            if (user == null) {
              loading = true;
              break;
            }

            text = t.user_notifications_planLeft_text(user.firstname);
            break;
          case NotificationTypes.planRemoved:
            var userId = notification.payload;

            var user = ref.watch(usersProvider)[userId];

            if (user == null) {
              loading = true;
              break;
            }

            text = t.user_notifications_planRemoved_text(user.fullname);
            break;
          case NotificationTypes.userRegistered:
            var user = ref.read(userProvider);

            text = t.user_notifications_userRegistered_text(user.firstname);

            var userTheme =
                user.theme == "桜" ? "sakura" : user.theme.toLowerCase();

            var userLang = user.language.isEn ? 'en' : 'de';
            var urlToLaunch =
                'https://projekte.tgm.ac.at/lb-planner/docs/?theme=$userTheme&lang=$userLang&section=0&heading=2';

            actions = [
              _Action(
                  text: t.user_notifications_userRegistered_docs,
                  // When pressed, open the docs in a browser
                  onPressed: () => launchUrl(Uri.parse(urlToLaunch))),
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
