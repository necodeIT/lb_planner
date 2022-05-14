part of lbplanner_routes;

/// Members section of the dropdown.
class CalendarPlanDropDownMembers extends StatelessWidget {
  /// Members section of the dropdown.
  const CalendarPlanDropDownMembers({Key? key, required this.searchController}) : super(key: key);

  /// The controller to use for the search bar.
  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: NcBodyText('Members'),
    );
  }
}
