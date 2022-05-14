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

      var members = plan.members.keys.where((member) => users[member] != null && users[member]!.fullname.containsCaseInsensitive(widget.searchController.text)).toList();

      members.sort((id1, id2) {
        var a = users[id1]!;
        var b = users[id2]!;

        var result = plan.members[id1]!.index.compareTo(plan.members[id2]!.index);

        return result == 0 ? a.fullname.compareTo(b.fullname) : result;
      });

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
                if (plan.members.length > 1) NcSpacing.small(),
                if (plan.members.length > 1)
                  LpButton(
                    child: ConditionalWidget(
                      condition: _leaveFuture != null,
                      trueWidget: (context) => LpLoadingIndicator.circular(
                        thickness: 2,
                        size: CalendarPlanDropDownBody.fontSize,
                        color: buttonTextColor,
                      ),
                      falseWidget: (context) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          NcTitleText(
                            t.calendar_plan_dropdown_members_leavePlan_title,
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
