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

    var controller = ref.read(planController);

    setState(() {
      _inviteFuture = controller.inviteUser(widget.userId);
    });

    await _inviteFuture;
    await controller.fetchPlan();

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

        // TODO: Check if user is already invited.

        return ConditionalWidget(
          condition: user != null,
          trueWidget: (context) {
            var plan = ref.watch(planProvider);

            var color = accentColor;
            IconData? icon;
            var text = t.calendar_plan_dropdown_members_inviteUsers_invite;

            VoidCallback? onTap = () => _inviteUser(ref);

            if (plan.members.containsKey(widget.userId)) {
              color = successColor;
              icon = Icons.check_circle;
              text = t.calendar_plan_dropdown_members_inviteUsers_inPlan;
              onTap = null;
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
