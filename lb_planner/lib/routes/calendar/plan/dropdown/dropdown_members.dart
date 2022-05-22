part of lbplanner_routes;

/// Members section of the dropdown.
class CalendarPlanDropDownMembers extends StatefulWidget {
  /// Members section of the dropdown.
  const CalendarPlanDropDownMembers({Key? key, required this.searchController}) : super(key: key);

  /// The controller to use for the search bar.
  final TextEditingController searchController;

  @override
  State<CalendarPlanDropDownMembers> createState() => _CalendarPlanDropDownMembersState();

  /// Filters the given [users] by the given [search] string.
  static bool filterSearch(int id, Map<int, User> users, String search) => users[id] != null && users[id]!.fullname.containsCaseInsensitive(search);
}

class _CalendarPlanDropDownMembersState extends State<CalendarPlanDropDownMembers> {
  Future? _leaveFuture;

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

  @override
  Widget build(context) {
    return Consumer(builder: (context, ref, _) {
      var plan = ref.watch(planProvider);
      var users = ref.watch(usersProvider);

      var members = plan.members.keys.where((id) => CalendarPlanDropDownMembers.filterSearch(id, users, widget.searchController.text)).toList();

      // var potentialMembers = users.values.where((user) => _filterSearch(user.id, users)).toList();

      members.sort((id1, id2) {
        var a = users[id1]!;
        var b = users[id2]!;

        var result = plan.members[id1]!.index.compareTo(plan.members[id2]!.index);

        return result == 0 ? a.fullname.compareTo(b.fullname) : result;
      });

      var accessLvl = plan.members[ref.read(userProvider).id]!;

      return Column(
        children: [
          LpTextField.filled(
            controller: widget.searchController,
            placeholder: t.calendar_plan_dropdown_members_search,
            fontSize: CalendarPlanDropDownBody.fontSize,
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
                NcSpacing.small(),
                Row(
                  children: [
                    Expanded(
                      child: LpButton.icon(
                        text: t.calendar_plan_dropdown_members_inviteUsers_btn,
                        icon: plan.members.length > 1 ? null : Feather.arrow_right_circle,
                        size: MainAxisSize.max,
                        alignment: MainAxisAlignment.spaceBetween,
                        trailing: true,
                        onPressed: () => lpShowAlertDialog(
                          context,
                          title: t.calendar_plan_dropdown_members_inviteUsers_title,
                          body: CalendarPlanDropDownInviteUsersDialog(),
                        ),
                      ),
                    ),
                    if (plan.members.length > 1) NcSpacing.small(),
                    if (plan.members.length > 1)
                      Expanded(
                        child: LpButton.icon(
                          text: _leaveFuture != null ? null : t.calendar_plan_dropdown_members_leavePlan_btn,
                          child: _leaveFuture == null
                              ? null
                              : LpLoadingIndicator.circular(
                                  size: CalendarPlanDropDownBody.fontSize,
                                  color: buttonTextColor,
                                ),
                          icon: accessLvl.isOwner ? null : Feather.arrow_right_circle,
                          size: MainAxisSize.max,
                          alignment: MainAxisAlignment.spaceBetween,
                          trailing: true,
                          onPressed: () => lpShowConfirmDialog(
                            context,
                            title: t.calendar_plan_dropdown_members_leavePlan_title,
                            message: t.calendar_plan_dropdown_members_leavePlan_message,
                            onConfirm: () => _leavePlan(ref),
                          ),
                          color: errorColor,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
