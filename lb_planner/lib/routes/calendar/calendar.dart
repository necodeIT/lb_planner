part of lbplanner_routes;

/// Calendar plan route.
class Calendar extends LocalizedWidget {
  /// Calendar plan route.
  const Calendar({Key? key, required this.child, this.header}) : super(key: key);

  /// The child to display.
  final Widget child;

  /// The header of the window.
  final Widget? header;

  /// The font size of the navigation dropdown.
  static const double fontSize = 18;

  @override
  Widget build(BuildContext context, t) {
    return LpContainer.window(
      leading: currentRoute == CalendarPlanRoute.routeName || currentRoute == CalendarModulesOverviewRoute.routeName
          ? LpDropdown<String>(
              alignment: Alignment.bottomLeft,
              fontSize: fontSize,
              value: currentRoute,
              items: [
                DropdownMenuItem(child: NcCaptionText(t.calendar_plan_title), value: CalendarPlanRoute.routeName),
                DropdownMenuItem(child: NcCaptionText(t.calendar_modulesOverview_title), value: CalendarModulesOverviewRoute.routeName),
              ],
              onChanged: (route) => Navigator.of(context).pushReplacementNamed(route!),
            )
          : null,
      trailing: header,
      child: child,
    );
  }
}
