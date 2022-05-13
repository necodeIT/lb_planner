part of lbplanner_routes;

/// Modules section of the dropdown.
class CalendarPlanDropDwonModules extends StatefulWidget {
  /// Modules section of the dropdown.
  const CalendarPlanDropDwonModules({Key? key}) : super(key: key);

  @override
  State<CalendarPlanDropDwonModules> createState() => _CalendarPlanDropDwonModulesState();
}

class _CalendarPlanDropDwonModulesState extends State<CalendarPlanDropDwonModules> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      var allModules = ref.watch(modulesProvider);
      var plan = ref.watch(planProvider);

      var modules = allModules.keys.where((module) => !plan.deadlines.keys.any((deadline) => deadline == module)).toList();

      return Column(
        children: [
          Row(
            children: [
              LpCheckbox(value: plan.ekEnabled, onChanged: (value) => ref.read(planController).setPlanEkEnabled(value)),
              NcSpacing.xs(),
              NcCaptionText(t.calendar_plan_dropdown_modules_enableEk),
            ],
          ),
          Expanded(
            child: ListView(
              children: [
                for (var module in modules) ...[
                  DraggableModule(moduleId: module),
                  NcSpacing.xs(),
                ]
              ],
            ),
          ),
        ],
      );
    });
  }
}
