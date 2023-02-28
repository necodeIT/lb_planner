part of lbplanner_routes;

/// Cell of the calendar view.
class CalendarPlanCell extends StatefulWidget {
  /// Cell of the calendar view.
  const CalendarPlanCell(
      {Key? key, required this.day, required this.isCurrentMonth})
      : super(key: key);

  /// The day this cell represents.
  final DateTime day;

  /// Whether this cell is in the current month.
  final bool isCurrentMonth;

  @override
  State<CalendarPlanCell> createState() => CalendarPlanCellState();
}

/// State of the [CalendarPlanCell].
class CalendarPlanCellState extends State<CalendarPlanCell> {
  /// The current width of a cell.
  ///
  /// This is used for [DraggableModule] to prevent them stretching over the whole screen.
  static double? currentWidth;

  final DateFormat _formatter = DateFormat.d();
  final List<int> _addedModules = [];
  final ScrollController _controller = ScrollController();

  void _setDeadline(WidgetRef ref, int module) async {
    var plan = ref.read(planProvider);
    var controller = ref.read(planController);

    var utc = DateTime.utc(widget.day.year, widget.day.month, widget.day.day);

    var deadline = Deadline(moduleId: module, start: utc, end: utc);

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

    return Consumer(
      builder: (context, ref, _) {
        var plan = ref.watch(planProvider);
        var user = ref.watch(userProvider);

        var allModules = ref.watch(modulesProvider);
        List<int> deadlines = plan.deadlines.values
            .where((deadline) => deadline.end.isSameDate(widget.day))
            .map((deadline) => deadline.moduleId)
            .toList();

        var modules = allModules.keys.where(deadlines.contains).toList();

        var accessLvl = plan.members[user.id];

        return AnimatedContainer(
          padding: const EdgeInsets.all(NcSpacing.xsSpacing),
          duration: kNormalAnimationDuration,
          decoration: BoxDecoration(
            // ignore: no-magic-number
            color: isToday ? accentColor.withOpacity(.1) : Colors.transparent,
            border: Border.all(
              // ignore: no-magic-number
              color: isToday ? accentColor : tertiaryColor,
              // ignore: no-magic-number
              width: widget.isCurrentMonth ? 0.7 : 0.2,
            ),
          ),
          child: LayoutBuilder(
            builder: (context, box) {
              currentWidth = box.maxWidth;
              return DragTarget<int>(
                onWillAccept: (module) => !modules.contains(module),
                onAccept: (module) => _setDeadline(ref, module),
                builder: (context, candidateData, rejectedData) {
                  if (_controller.hasClients &&
                      (_addedModules.isNotEmpty ||
                          candidateData.isNotEmpty ||
                          _controller.position.outOfRange)) {
                    WidgetsBinding.instance.addPostFrameCallback(
                      (timeStamp) => _controller.animateTo(
                        _controller.position.maxScrollExtent,
                        duration: kFastAnimationDuration,
                        curve: kAnimationCurve,
                      ),
                    );
                  }

                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(NcSpacing.xsSpacing),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            if (user.displayTaskCount)
                              NcBodyText(
                                t.calendar_plan_tasks(modules.length),
                                textAlign: TextAlign.center,
                                color: widget.isCurrentMonth
                                    ? textColor
                                    // ignore: no-magic-number
                                    : textColor.withOpacity(0.7),
                              ),
                            NcBodyText(
                              _formatter.format(widget.day),
                              textAlign: TextAlign.center,
                              color: isToday
                                  ? accentColor
                                  : widget.isCurrentMonth
                                      ? textColor
                                      // ignore: no-magic-number
                                      : textColor.withOpacity(0.7),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          controller: _controller,
                          children: [
                            if (plan.loading || accessLvl == null) ...[
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
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
