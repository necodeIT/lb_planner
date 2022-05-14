part of lbplanner_routes;

/// Member widget for the members section of the dropdown.
class CalendarPlanMembersMember extends StatefulWidget {
  /// Member widget for the members section of the dropdown.
  const CalendarPlanMembersMember({Key? key, required this.memberId}) : super(key: key);

  /// The id of the member to display.
  final int memberId;

  @override
  State<CalendarPlanMembersMember> createState() => _CalendarPlanMembersMemberState();
}

class _CalendarPlanMembersMemberState extends State<CalendarPlanMembersMember> {
  Future? _removeFuture;
  Future? _accessLevelFuture;

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
    return Consumer(builder: (context, ref, _) {
      var plan = ref.watch(planProvider);
      var users = ref.watch(usersProvider);

      var member = users[widget.memberId]!;
      var accessLevel = plan.members[widget.memberId]!;

      return Container(
        height: ModuleWidget.height,
        padding: EdgeInsets.all(NcSpacing.xsSpacing),
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(kRadius),
          boxShadow: kElevationToShadow[2],
        ),
        child: Row(
          children: [
            NcSpacing.xs(),
            Expanded(
              child: NcCaptionText(
                member.fullname,
                fontSize: ModuleWidget.fontSize,
              ),
            ),
            NcSpacing.xs(),
            Row(
              children: [
                ConditionalWidget(
                  condition: _accessLevelFuture == null,
                  trueWidget: (context) => ConditionalWrapper(
                    condition: !accessLevel.isOwner,
                    wrapper: (context, child) => ScaleOnHover(
                      onTap: () => _changeAccessLevel(ref, accessLevel.opposite),
                      duration: kFasterAnimationDuration,
                      scale: 1.1,
                      child: child,
                    ),
                    child: LpIcon(
                      accessLevel.icon,
                      color: accentColor,
                      size: ModuleWidget.fontSize,
                    ),
                  ),
                  falseWidget: (context) => LpLoadingIndicator.circular(
                    color: accentColor,
                    size: ModuleWidget.fontSize,
                    thickness: 2,
                  ),
                ),
                if (!accessLevel.isOwner) NcSpacing.small(),
                if (!accessLevel.isOwner)
                  ScaleOnHover(
                    duration: kFasterAnimationDuration,
                    scale: 1.1,
                    onTap: () => _removeMember(ref),
                    child: LpIcon(
                      Icons.remove_circle_outline,
                      color: errorColor,
                      size: ModuleWidget.fontSize,
                    ),
                  ),
                NcSpacing.xs(),
              ],
            ),
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
