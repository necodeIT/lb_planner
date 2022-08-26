part of lbplanner_routes;

/// Displays a user that can be invited to the plan.
class CalendarPlanDropDownInviteUsersUser extends StatefulWidget {
  /// Displays a user that can be invited to the plan.
  const CalendarPlanDropDownInviteUsersUser({Key? key, required this.userId}) : super(key: key);

  /// The id of the user to display.
  final int userId;

  /// The size of the profile picture.
  static const double imgSize = 55;

  /// The size of the font displaying the username.
  static const double usernameFontSize = 20;

  /// The size of the font.
  static const double fontSize = 18;

  /// The size of the font, displaying the user tag.
  static const double userTagFontSize = 17;

  @override
  State<CalendarPlanDropDownInviteUsersUser> createState() => _CalendarPlanDropDownInviteUsersUserState();
}

class _CalendarPlanDropDownInviteUsersUserState extends State<CalendarPlanDropDownInviteUsersUser> {
  Future? _inviteFuture;

  void _inviteUser(WidgetRef ref) async {
    if (_inviteFuture != null) return;

    var plan = ref.read(planController);
    var invites = ref.read(invitesController);

    setState(() {
      _inviteFuture = plan.inviteUser(widget.userId);
    });

    await _inviteFuture;
    await invites.fetchInvites();
    await plan.fetchPlan();

    if (!mounted) return;

    setState(() {
      _inviteFuture = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        var user = ref.watch(usersProvider)[widget.userId];

        return ConditionalWidget(
          condition: user != null,
          trueWidget: (context) {
            var plan = ref.watch(planProvider);
            var invites = ref.watch(invitesProvider);

            var color = accentColor;
            IconData? icon;
            var text = t.calendar_plan_dropdown_members_inviteUsers_invite;

            VoidCallback? onTap = () => _inviteUser(ref);

            var filteredInvites = invites.values.where((e) => e.invitee == widget.userId).toList();

            filteredInvites.sort((a, b) => a.timeStamp.compareTo(b.timeStamp));

            if (filteredInvites.isNotEmpty) {
              var invite = filteredInvites.last;

              if (invite.status.isPending) {
                icon = Icons.mail;
                text = t.calendar_plan_dropdown_members_inviteUsers_invited;
                onTap = null;
              }

              if (invite.status.isDeclined) {
                icon = Icons.shortcut;
                text = t.calendar_plan_dropdown_members_inviteUsers_reInvite;
              }

              if (invite.status.isAccepted && plan.members.containsKey(widget.userId)) {
                color = successColor;
                icon = Icons.check_circle;
                text = t.calendar_plan_dropdown_members_inviteUsers_inPlan;
                onTap = null;
              }
            }

            return Container(
              padding: const EdgeInsets.all(NcSpacing.mediumSpacing),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kRadius),
                color: secondaryColor,
              ),
              child: Row(
                children: [
                  UserProfileImg(
                    size: CalendarPlanDropDownInviteUsersUser.imgSize,
                    userId: widget.userId,
                  ),
                  NcSpacing.small(),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        NcCaptionText(
                          user!.fullname,
                          fontSize: CalendarPlanDropDownInviteUsersUser.usernameFontSize,
                        ),
                        NcBodyText(
                          t.calendar_plan_dropdown_members_inviteUsers_userTag(user.username),
                          fontSize: CalendarPlanDropDownInviteUsersUser.userTagFontSize,
                        ),
                      ],
                    ),
                  ),
                  ConditionalWidget(
                    condition: _inviteFuture != null,
                    trueWidget: (_) => LpLoadingIndicator.circular(),
                    falseWidget: (context) => ConditionalWidget(
                      condition: onTap != null,
                      trueWidget: (_) => LpTextButton(
                        leadingIcon: icon,
                        fontSize: CalendarPlanDropDownInviteUsersUser.fontSize,
                        text: text,
                        onPressed: onTap!,
                        decoration: TextDecoration.underline,
                        color: color,
                      ),
                      falseWidget: (_) => Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (icon != null) LpIcon(icon, color: color, size: scaleIcon(CalendarPlanDropDownInviteUsersUser.fontSize)),
                          if (icon != null) NcSpacing.small(),
                          NcCaptionText(
                            text,
                            color: color,
                            fontSize: CalendarPlanDropDownInviteUsersUser.fontSize,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          falseWidget: (context) => LpShimmer(),
        );
      },
    );
  }
}
