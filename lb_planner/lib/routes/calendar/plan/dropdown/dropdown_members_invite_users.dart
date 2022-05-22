part of lbplanner_routes;

class CalendarPlanDropDownInviteUsersDialog extends StatefulWidget {
  CalendarPlanDropDownInviteUsersDialog({Key? key}) : super(key: key);

  @override
  State<CalendarPlanDropDownInviteUsersDialog> createState() => _CalendarPlanDropDownInviteUsersDialogState();
}

class _CalendarPlanDropDownInviteUsersDialogState extends State<CalendarPlanDropDownInviteUsersDialog> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        return Column(
          children: [
            LpTextField.filled(
              controller: _searchController,
              placeholder: t.calendar_plan_dropdown_members_inviteUsers_search,
              fontSize: CalendarPlanDropDownBody.fontSize,
            ),
          ],
        );
      },
    );
  }
}
