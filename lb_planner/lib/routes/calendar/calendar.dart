part of lbplanner_routes;

/// Calendar plan route.
class Calendar extends LocalizedWidget {
  /// Calendar plan route.
  const Calendar({Key? key, required this.child, this.header}) : super(key: key);

  /// The child to display.
  final Widget child;

  /// The header of the window.
  final Widget? header;

  @override
  Widget create(BuildContext context, t) {
    return LpContainer.window(
      leading: LpDropdown<String>(
        fontSize: 18,
        value: currentRoute,
        items: [
          DropdownMenuItem(child: NcCaptionText(t.calendar_plan_title), value: CalendarPlanRoute.routeName),
          DropdownMenuItem(child: NcCaptionText(t.calendar_modulesOverview_title), value: CalendarModulesOverviewRoute.routeName),
        ],
        onChanged: (route) => Navigator.of(context).pushNamed(route!),
      ),
      trailing: header,
      child: child,
    );
  }
}
