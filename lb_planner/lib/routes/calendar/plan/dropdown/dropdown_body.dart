part of lbplanner_routes;

/// Dropdown body.
class CalendarPlanDropDownBody extends StatefulWidget {
  /// Dropdown body.
  const CalendarPlanDropDownBody({Key? key, required this.close}) : super(key: key);

  /// Callback to close the dropdown.
  final VoidCallback close;

  /// Builder for the body.
  static CalendarPlanDropDownBody popupBuilder(BuildContext context, VoidCallback close) => CalendarPlanDropDownBody(close: close);

  /// The font size of the dropdown.
  static const double fontSize = 15.0;

  @override
  State<CalendarPlanDropDownBody> createState() => _CalendarPlanDropDownBodyState();
}

class _CalendarPlanDropDownBodyState extends State<CalendarPlanDropDownBody> {
  bool _showModules = true;
  final TextEditingController _searchController = TextEditingController();

  void showModules() {
    setState(() {
      _searchController.text = "";
      _showModules = true;
    });
  }

  void showMembers() {
    setState(() {
      _searchController.text = "";
      _showModules = false;
    });
  }

  @override
  initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
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
        // ignore: no-magic-number
        width: screen.width * .25,
        // ignore: no-magic-number
        height: screen.height * 0.6,
        child: Column(
          children: [
            NcSpacing.medium(),
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
                  trueWidget: (_) => CalendarPlanDropDwonModules(searchController: _searchController),
                  falseWidget: (_) => CalendarPlanDropDownMembers(searchController: _searchController),
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
