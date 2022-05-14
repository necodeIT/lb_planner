part of lbplanner_routes;

/// Modules section of the dropdown.
class CalendarPlanDropDwonModules extends StatefulWidget {
  /// Modules section of the dropdown.
  const CalendarPlanDropDwonModules({Key? key, required this.searchController}) : super(key: key);

  /// The controller to use for the search bar.
  final TextEditingController searchController;

  @override
  State<CalendarPlanDropDwonModules> createState() => _CalendarPlanDropDwonModulesState();
}

class _CalendarPlanDropDwonModulesState extends State<CalendarPlanDropDwonModules> {
  Future? _clearFuture;

  void _clearPlan(WidgetRef ref) async {
    if (_clearFuture != null) return;

    var controller = ref.read(planController);

    setState(() {
      _clearFuture = controller.clearPlan();
    });

    await _clearFuture;
    await ref.read(modulesController).fetchModules();

    if (!mounted) return;

    setState(() {
      _clearFuture = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      var allModules = ref.watch(modulesProvider);
      var plan = ref.watch(planProvider);
      var user = ref.watch(userProvider);

      var accessLvl = plan.members[user.id]!;

      var modules = allModules.keys.where(
        (module) {
          var hasDeadline = plan.deadlines.keys.any((deadline) => deadline == module);
          var data = allModules[module]!;
          var course = ref.read(coursesProvider)[data.courseId]!;

          var containsQuery = "${course.shortname} ${data.name}".containsCaseInsensitive(widget.searchController.text);

          return !hasDeadline && containsQuery;
        },
      ).toList();

      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NcCaptionText(
                t.calendar_plan_dropdown_modules_enableEk,
                fontSize: CalendarPlanDropDownBody.fontSize,
              ),
              NcSpacing.xs(),
              LpCheckbox(value: plan.ekEnabled, onChanged: (value) => ref.read(planController).setPlanEkEnabled(value)),
            ],
          ),
          NcSpacing.medium(),
          LpTextField.filled(
            controller: widget.searchController,
            placeholder: t.calendar_plan_dropdown_modules_search,
            fontSize: CalendarPlanDropDownBody.fontSize,
          ),
          NcSpacing.small(),
          Expanded(
            child: ListView(
              children: [
                for (var module in modules) ...[
                  DraggableModule(moduleId: module),
                  NcSpacing.xs(),
                ],
                if (!accessLvl.isRead) NcSpacing.small(),
                if (!accessLvl.isRead)
                  LpButton(
                    child: ConditionalWidget(
                      condition: _clearFuture != null,
                      trueWidget: (context) => LpLoadingIndicator.circular(
                        thickness: 2,
                        size: CalendarPlanDropDownBody.fontSize,
                        color: buttonTextColor,
                      ),
                      falseWidget: (context) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          NcTitleText(
                            t.calendar_plan_dropdown_modules_clearPlan_btn,
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
                      title: t.calendar_plan_dropdown_modules_clearPlan_title,
                      body: NcBodyText(t.calendar_plan_dropdown_modules_clearPlan_message),
                      onConfirm: () => _clearPlan(ref),
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
