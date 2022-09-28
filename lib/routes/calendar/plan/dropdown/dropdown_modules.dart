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
  Future? _ekFuture;

  void _enableEk(WidgetRef ref, bool value) async {
    if (_ekFuture != null) return;

    var controller = ref.read(planController);

    setState(() {
      _ekFuture = controller.setPlanEkEnabled(value);
    });

    await _ekFuture;
    await ref.read(modulesController).fetchModules();

    if (!mounted) return;

    setState(() {
      _ekFuture = null;
    });
  }

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
      var user = ref.watch(userProvider);

      if (user.loading) return LpShimmer();

      var allModules = ref.watch(modulesProvider);
      var plan = ref.watch(planProvider);

      var accessLvl = plan.members[user.id]!;

      var modules = allModules.keys.where(
        (module) {
          var hasDeadline = plan.deadlines.keys.any((deadline) => deadline == module);
          var data = allModules[module]!;
          var course = ref.read(coursesProvider)[data.courseId]!;

          var containsQuery = "${course.shortname} ${data.name}".containsCaseInsensitive(widget.searchController.text);

          return !hasDeadline && containsQuery && !data.type.isTest;
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
              ConditionalWidget(
                  condition: _ekFuture == null,
                  trueWidget: (_) => LpCheckbox(value: plan.ekEnabled, onChanged: accessLvl.isRead ? null : (value) => _enableEk(ref, value)),
                  falseWidget: (_) => Padding(
                        padding: const EdgeInsets.all(8.5), // Do not touch!
                        child: LpLoadingIndicator.circular(),
                      )),
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
                  DraggableModule(moduleId: module, allowContextMenu: false),
                  NcSpacing.xs(),
                ],
                if (!accessLvl.isRead) NcSpacing.small(),
                if (!accessLvl.isRead)
                  LpButton.icon(
                    text: _clearFuture != null ? null : t.calendar_plan_dropdown_modules_clearPlan_btn,
                    child: _clearFuture == null
                        ? null
                        : LpLoadingIndicator.circular(
                            size: CalendarPlanDropDownBody.fontSize,
                            color: buttonTextColor,
                          ),
                    icon: Feather.arrow_right_circle,
                    size: MainAxisSize.max,
                    alignment: MainAxisAlignment.spaceBetween,
                    trailing: true,
                    onPressed: () => lpShowConfirmDialog(
                      context,
                      title: t.calendar_plan_dropdown_modules_clearPlan_title,
                      message: t.calendar_plan_dropdown_modules_clearPlan_message,
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
