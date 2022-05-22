part of lbplanner_routes;

/// Member widget for the members section of the dropdown.
class CalendarPlanMembersMember extends StatefulWidget {
  /// Member widget for the members section of the dropdown.
  const CalendarPlanMembersMember({Key? key, required this.memberId, required this.potential, this.fontSize}) : super(key: key);

  /// The id of the member to display.
  final int memberId;

  /// Whether the member is a potential member or is already in the plan.
  final bool potential;

  /// The font size to use.
  final double? fontSize;

  @override
  State<CalendarPlanMembersMember> createState() => _CalendarPlanMembersMemberState();
}

class _CalendarPlanMembersMemberState extends State<CalendarPlanMembersMember> {
  Future? _removeFuture;
  Future? _accessLevelFuture;
  Future? _inviteFuture;

  void _inviteUser(WidgetRef ref) async {
    if (_inviteFuture != null) return;

    var controller = ref.read(planController);

    setState(() {
      _inviteFuture = controller.inviteUser(widget.memberId);
    });

    await _inviteFuture;
    await controller.fetchPlan();

    if (!mounted) return;

    setState(() {
      _inviteFuture = null;
    });
  }

  void _removeMember(WidgetRef ref) async {
    if (_removeFuture != null) return;

    var controller = ref.read(planController);

    setState(() {
      _removeFuture = controller.removeUser(widget.memberId);
    });

    await _removeFuture;

    if (!mounted) return;

    setState(() {
      _removeFuture = null;
    });
  }

  void _changeAccessLevel(WidgetRef ref, PlanAccessLevels accessLevel) async {
    if (_accessLevelFuture != null) return;

    var controller = ref.read(planController);

    setState(() {
      _accessLevelFuture = controller.setUserAccessLevel(
        widget.memberId,
        accessLevel,
      );
    });

    await _accessLevelFuture;

    if (!mounted) return;

    setState(() {
      _accessLevelFuture = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    double fontSize = widget.fontSize ?? ModuleWidget.fontSize;

    return Consumer(builder: (context, ref, _) {
      var users = ref.watch(usersProvider);
      var plan = ref.watch(planProvider);

      var member = users[widget.memberId]!;

      return Container(
        height: ModuleWidget.height,
        padding: EdgeInsets.all(NcSpacing.xsSpacing),
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(kRadius),
          boxShadow: kElevationToShadow[ModuleWidget.elevation],
        ),
        child: Row(
          children: [
            NcSpacing.xs(),
            Expanded(
              child: NcCaptionText(
                member.fullname,
                fontSize: fontSize,
              ),
            ),
            NcSpacing.xs(),
            ConditionalWidget(
                condition: widget.potential,
                trueWidget: (context) {
                  var color = accentColor;
                  var icon = Icons.add_circle_outline_rounded;
                  VoidCallback? onTap = () => _inviteUser(ref);

                  if (plan.members.containsKey(widget.memberId)) {
                    color = successColor;
                    icon = Icons.check_circle;
                    onTap = null;
                  }

                  // TODO: Check if user is already invited.

                  return ConditionalWidget(
                      condition: _inviteFuture != null,
                      trueWidget: (_) => LpLoadingIndicator.circular(),
                      falseWidget: (context) => ConditionalWrapper(
                            condition: onTap != null,
                            wrapper: (context, child) => GestureDetector(
                              onTap: onTap,
                              child: child,
                            ),
                            child: LpIcon(
                              icon,
                              color: color,
                              size: fontSize,
                            ),
                          ));
                },
                falseWidget: (context) {
                  var accessLevel = plan.members[widget.memberId]!;

                  return Row(
                    children: [
                      ConditionalWidget(
                        condition: _accessLevelFuture == null,
                        trueWidget: (context) => ConditionalWrapper(
                          condition: !accessLevel.isOwner,
                          wrapper: (context, child) => ScaleOnHover(
                            onTap: () => _changeAccessLevel(ref, accessLevel.opposite),
                            duration: kFasterAnimationDuration,
                            // ignore: no-magic-number
                            scale: 1.1,
                            child: child,
                          ),
                          child: LpIcon(
                            accessLevel.icon,
                            color: accentColor,
                            size: fontSize,
                          ),
                        ),
                        falseWidget: (context) => LpLoadingIndicator.circular(
                          color: accentColor,
                          size: fontSize,
                        ),
                      ),
                      if (!accessLevel.isOwner) NcSpacing.small(),
                      if (!accessLevel.isOwner)
                        ScaleOnHover(
                          duration: kFasterAnimationDuration,
                          // ignore: no-magic-number
                          scale: 1.1,
                          onTap: () => lpShowConfirmDialog(
                            context,
                            title: t.calendar_plan_dropdown_members_removeMemver_title,
                            message: t.calendar_plan_dropdown_members_removeMemver_message,
                            onConfirm: () => _removeMember(ref),
                          ),
                          child: LpIcon(
                            Icons.remove_circle_outline,
                            color: errorColor,
                            size: fontSize,
                          ),
                        ),
                      NcSpacing.xs(),
                    ],
                  );
                }),
          ],
        ),
      );
    });
  }
}

extension _Ext on PlanAccessLevels {
  IconData get icon {
    switch (this) {
      case PlanAccessLevels.owner:
        return FontAwesomeIcons.crown;

      case PlanAccessLevels.write:
        return Icons.edit;
      case PlanAccessLevels.read:
        return Icons.remove_red_eye;
    }
  }

  PlanAccessLevels get opposite {
    switch (this) {
      case PlanAccessLevels.owner:
        throw "Cannot get opposite of owner";
      case PlanAccessLevels.write:
        return PlanAccessLevels.read;
      case PlanAccessLevels.read:
        return PlanAccessLevels.write;
    }
  }
}
