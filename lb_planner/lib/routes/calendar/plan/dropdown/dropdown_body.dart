part of lbplanner_routes;

/// Dropdown body.
class CalendarPlanDropDownBody extends StatefulWidget {
  /// Dropdown body.
  const CalendarPlanDropDownBody({Key? key, required this.close}) : super(key: key);

  /// Callback to close the dropdown.
  final VoidCallback close;

  /// Builder for the body.
  static CalendarPlanDropDownBody popupBuilder(BuildContext context, VoidCallback close) => CalendarPlanDropDownBody(close: close);

  @override
  State<CalendarPlanDropDownBody> createState() => _CalendarPlanDropDownBodyState();
}

class _CalendarPlanDropDownBodyState extends State<CalendarPlanDropDownBody> {
  bool _showModules = true;

  void showModules() {
    setState(() {
      _showModules = true;
    });
  }

  void showMembers() {
    setState(() {
      _showModules = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      var plan = ref.watch(planProvider);

      return LpContainer(
        trailing: GestureDetector(
          onTap: widget.close,
          child: LpIcon(
            Icons.close,
            color: errorColor,
          ),
        ),
        title: plan.name,
        width: UserNotificationsPopup.width * 1.5,
        height: UserNotificationsPopup.height * 2,
        child: Column(
          children: [
            NcSpacing.small(),
            Row(
              children: [
                Expanded(
                  child: CalendarPlanDropdownHeader(
                    active: _showModules,
                    onTap: showModules,
                    title: t.calendar_plan_dropdown_modules_title,
                  ),
                ),
                Expanded(
                  child: CalendarPlanDropdownHeader(
                    active: !_showModules,
                    onTap: showMembers,
                    title: t.calendar_plan_dropdown_members_title,
                  ),
                ),
              ],
            ),
            NcSpacing.small(),
            Expanded(
              child: PageTransitionSwitcher(
                // reverse: lastMonth.isBefore(month),
                duration: kSlowAnimationDuration,
                child: ConditionalWidget(
                  key: ValueKey(_showModules),
                  condition: _showModules,
                  trueWidget: (_) => CalendarPlanDropDwonModules(),
                  falseWidget: (_) => CalendarPlanDropDownMembers(),
                ),
                transitionBuilder: (child, primaryAnimation, secondaryAnimation) => SharedAxisTransition(
                  animation: primaryAnimation,
                  secondaryAnimation: secondaryAnimation,
                  transitionType: SharedAxisTransitionType.vertical,
                  child: child,
                  fillColor: primaryColor,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
