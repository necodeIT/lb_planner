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
  bool planNameEditMode = false;

  Future? planNameFuture;

  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _planNameController = TextEditingController();

  void _enterEditMode(WidgetRef ref) {
    if (planNameFuture != null) return;

    var plan = ref.read(planProvider);

    setState(() {
      planNameEditMode = true;

      _planNameController.text = plan.name;
    });
  }

  void exitEditMode() {
    if (planNameFuture != null) return;

    setState(() {
      planNameEditMode = false;
    });
  }

  void setPlanName(WidgetRef ref) async {
    var controller = ref.read(planController);
    var plan = ref.read(planProvider);

    if (plan.name == _planNameController.text) {
      exitEditMode();
      return;
    }

    setState(() {
      planNameFuture = controller.setPlanName(_planNameController.text);
    });

    await planNameFuture;

    if (!mounted) return;

    setState(() {
      planNameFuture = null;
      planNameEditMode = false;
    });
  }

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
        trailing: Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ConditionalWidget(
                condition: planNameEditMode,
                trueWidget: (_) => Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: NcSpacing.mediumSpacing),
                    child: LpTextField(
                      placeholder: t.calendar_plan_dropdown_planName_placeholder,
                      onCancel: exitEditMode,
                      onUnfocus: exitEditMode,
                      autoFocus: true,
                      controller: _planNameController,
                      onSubmitted: (text) => setPlanName(ref),
                      suffix: planNameFuture != null
                          ? LpLoadingIndicator.circular(
                              center: false,
                            )
                          : null,
                    ),
                  ),
                ),
                falseWidget: (_) => LpGestureDetector(
                  onDoubleTap: () => _enterEditMode(ref),
                  child: NcTitleText(plan.name, fontSize: LpContainer.titleFontSize),
                ),
              ),
              LpGestureDetector(
                onTap: widget.close,
                child: LpIcon(
                  Icons.close,
                  color: errorColor,
                ),
              ),
            ],
          ),
        ),
        // ignore: no-magic-number
        width: screen.width * .2,
        // ignore: no-magic-number
        height: screen.height * 0.6,
        child: Column(
          children: [
            NcSpacing.medium(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: NcSpacing.mediumSpacing),
                  child: CalendarPlanDropdownHeader(
                    active: _showModules,
                    onTap: showModules,
                    title: t.calendar_plan_dropdown_modules_title,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: NcSpacing.mediumSpacing),
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
