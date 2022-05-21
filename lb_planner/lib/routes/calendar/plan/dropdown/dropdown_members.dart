part of lbplanner_routes;

/// Members section of the dropdown.
class CalendarPlanDropDownMembers extends StatefulWidget {
  /// Members section of the dropdown.
  const CalendarPlanDropDownMembers({Key? key, required this.searchController}) : super(key: key);

  /// The controller to use for the search bar.
  final TextEditingController searchController;

  @override
  State<CalendarPlanDropDownMembers> createState() => _CalendarPlanDropDownMembersState();
}

class _CalendarPlanDropDownMembersState extends State<CalendarPlanDropDownMembers> {
  Future? _leaveFuture;
  bool _inviteMode = false;

  void _toggleInviteMode() {
    setState(() {
      _inviteMode = !_inviteMode;
    });
  }

  void _leavePlan(WidgetRef ref) async {
    if (_leaveFuture != null) return;

    var controller = ref.read(planController);

    setState(() {
      _leaveFuture = controller.leavePlan();
      // _leaveFuture = Future.delayed(Duration(seconds: 5));
    });

    await _leaveFuture;
    await controller.fetchPlan();
    await ref.read(modulesController).fetchModules();

    if (!mounted) return;

    setState(() {
      _leaveFuture = null;
    });
  }

  bool _filterSearch(int id, Map<int, User> users) => users[id] != null && users[id]!.fullname.containsCaseInsensitive(widget.searchController.text);

  @override
  Widget build(context) {
    return Consumer(builder: (context, ref, _) {
      var plan = ref.watch(planProvider);
      var users = ref.watch(usersProvider);

      var members = _inviteMode ? users.keys.where((id) => _filterSearch(id, users)).toList() : plan.members.keys.where((id) => _filterSearch(id, users)).toList();

      members.sort((id1, id2) {
        var a = users[id1]!;
        var b = users[id2]!;

        var result = _inviteMode ? 0 : plan.members[id1]!.index.compareTo(plan.members[id2]!.index);

        return result == 0 ? a.fullname.compareTo(b.fullname) : result;
      });

      var accessLvl = _inviteMode ? PlanAccessLevels.read : plan.members[ref.read(userProvider).id]!;

      return Column(
        children: [
          Row(
            children: [
              Expanded(
                child: LpTextField.filled(
                  controller: widget.searchController,
                  placeholder: t.calendar_plan_dropdown_members_search,
                  fontSize: CalendarPlanDropDownBody.fontSize,
                ),
              ),
              if (accessLvl.isOwner) NcSpacing.xs(),
              ConditionalWidget(
                condition: accessLvl.isOwner,
                trueWidget: (_) => GestureDetector(
                  onTap: _toggleInviteMode,
                  child: LpIcon(_inviteMode ? Icons.cancel_outlined : Icons.add_circle_outline, color: accentColor),
                ),
                falseWidget: (_) => SizedBox.shrink(),
              ),
            ],
          ),
          NcSpacing.medium(),
          Expanded(
            child: ListView(
              children: [
                for (var member in members) ...[
                  CalendarPlanMembersMember(
                    memberId: member,
                  ),
                  NcSpacing.xs(),
                ],
                if (plan.members.length > 1) NcSpacing.small(),
                if (plan.members.length > 1)
                  LpButton(
                    child: ConditionalWidget(
                      condition: _leaveFuture != null,
                      trueWidget: (context) => LpLoadingIndicator.circular(
                        size: CalendarPlanDropDownBody.fontSize,
                        color: buttonTextColor,
                      ),
                      falseWidget: (context) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          NcTitleText(
                            t.calendar_plan_dropdown_members_leavePlan_btn,
                            fontSize: LpButton.defaultFontSize,
                            buttonText: true,
                          ),
                          NcSpacing.xs(),
                          LpIcon(Feather.arrow_right_circle, color: buttonTextColor, size: LpButton.iconSize),
                        ],
                      ),
                    ),
                    onPressed: () => lpShowConfirmDialog(
                      context,
                      title: t.calendar_plan_dropdown_members_leavePlan_title,
                      body: NcBodyText(t.calendar_plan_dropdown_members_leavePlan_message),
                      onConfirm: () => _leavePlan(ref),
                    ),
                    color: errorColor,
                  ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
