part of lbplanner_routes;

/// Cell of the calendar view.
class CalendarPlanCell extends StatefulWidget {
  /// Cell of the calendar view.
  const CalendarPlanCell({Key? key, required this.day, required this.isCurrentMonth}) : super(key: key);

  /// The day this cell represents.
  final DateTime day;

  /// Whether this cell is in the current month.
  final bool isCurrentMonth;

  @override
  State<CalendarPlanCell> createState() => CalendarPlanCellState();
}

/// State of the [CalendarPlanCell].
class CalendarPlanCellState extends State<CalendarPlanCell> {
  /// The width of the cell.
  static double currentWidth = 0;

  final DateFormat _formatter = DateFormat.d();

  final List<int> _addedModules = [];

  void _setDeadline(WidgetRef ref, int module) async {
    var plan = ref.read(planProvider);
    var controller = ref.read(planController);

    var deadline = Deadline(moduleId: module, start: widget.day, end: widget.day);

    Future<RawApiResponse> future;

    if (plan.deadlines.containsKey(module)) {
      if (plan.deadlines[module]!.end.isSameDate(widget.day)) return;

      future = controller.updateDeadline(deadline);
    } else {
      future = controller.addDeadline(deadline);
    }

    setState(() {
      _addedModules.add(module);
    });

    await future;

    if (!mounted) return;

    await ref.read(modulesController).fetchModules();

    setState(() {
      _addedModules.remove(module);
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isToday = widget.day.isSameDate(DateTime.now());

    return Consumer(builder: (context, ref, _) {
      var plan = ref.watch(planProvider);
      List<int> modules = plan.deadlines.values.where((deadline) => deadline.end.isSameDate(widget.day)).map((deadline) => deadline.moduleId).toList();

      return AnimatedContainer(
        padding: const EdgeInsets.all(NcSpacing.xsSpacing),
        duration: kNormalAnimationDuration,
        decoration: BoxDecoration(
          border: Border.all(
            color: tertiaryColor,
            width: widget.isCurrentMonth ? 0.5 : 0.2,
          ),
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(NcSpacing.xsSpacing),
                child: NcBodyText(
                  _formatter.format(widget.day),
                  textAlign: TextAlign.center,
                  color: isToday
                      ? accentColor
                      : widget.isCurrentMonth
                          ? textColor
                          : textColor.withOpacity(0.7),
                ),
              ),
            ),
            Expanded(
              child: LayoutBuilder(builder: (context, box) {
                currentWidth = box.maxWidth;
                return DragTarget<int>(
                  onAccept: (module) => _setDeadline(ref, module),
                  builder: (context, candidateData, rejectedData) {
                    return ListView(
                      controller: ScrollController(),
                      children: [
                        if (plan.loading) ...[
                          LpShimmer(),
                          NcSpacing.xs(),
                          LpShimmer(),
                          NcSpacing.xs(),
                          LpShimmer(),
                          NcSpacing.xs(),
                        ] else ...[
                          for (var module in modules) ...[
                            DraggableModule(moduleId: module),
                            NcSpacing.xs(),
                          ],
                          for (var i in _addedModules)
                            if (!modules.contains(i)) ...[
                              LpShimmer(),
                              NcSpacing.xs(),
                            ],
                          for (var i in candidateData)
                            if (!modules.contains(i)) ...[
                              LpShimmer(),
                              NcSpacing.xs(),
                            ],
                        ]
                      ],
                    );
                  },
                );
              }),
            ),
          ],
        ),
      );
    });
  }
}

extension _DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}
