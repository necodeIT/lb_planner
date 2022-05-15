part of lbplanner_routes;

/// Wraps the [ModuleWidget] in a [LongPressDraggable].
class DraggableModule extends StatefulWidget {
  /// Wraps the [ModuleWidget] in a [LongPressDraggable].
  const DraggableModule({Key? key, required this.moduleId, this.allowContextMenu = true}) : super(key: key);

  /// The id of the module to display.
  final int moduleId;

  /// Whether to allow the context menu.
  final bool allowContextMenu;

  @override
  State<DraggableModule> createState() => _DraggableModuleState();
}

class _DraggableModuleState extends State<DraggableModule> {
  bool _isClearing = false;

  void _removeDeadline(WidgetRef ref) async {
    throw "Test";
    if (_isClearing) return;

    setState(() {
      _isClearing = true;
    });

    var controller = ref.read(planController);
    var deadline = ref.read(planProvider).deadlines[widget.moduleId]!;

    // await controller.deleteDeadline(deadline);

    if (!mounted) return;

    setState(() {
      _isClearing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) => LayoutBuilder(
        builder: (context, box) {
          var width = CalendarPlanCellState.currentWidth > 0 ? CalendarPlanCellState.currentWidth : box.maxWidth;
          var plan = ref.watch(planProvider);
          var user = ref.watch(userProvider);

          var accessLvl = plan.members[user.id];
          var module = ref.watch(modulesProvider)[widget.moduleId]!;

          return ConditionalWidget(
              condition: _isClearing,
              trueWidget: (_) => LpShimmer(),
              falseWidget: (context) => ConditionalWrapper(
                    condition: widget.allowContextMenu,
                    wrapper: (_, child) => ContextMenuRegion(
                      contextMenu: GenericContextMenu(
                        buttonConfigs: [
                          ContextMenuButtonConfig(
                            t.module_openUrl,
                            icon: LpIcon.contextMenu(
                              Icons.link,
                            ),
                            iconHover: LpIcon.contextMenu(
                              Icons.link,
                              color: accentColor,
                            ),
                            onPressed: () => launchUrl(Uri.parse(module.url)),
                          ),
                          if (accessLvl != null && !accessLvl.isRead)
                            ContextMenuButtonConfig(
                              t.calendar_plan_deleteDeadline,
                              icon: LpIcon.contextMenu(
                                Icons.delete,
                              ),
                              iconHover: LpIcon.contextMenu(
                                Icons.delete,
                                color: errorColor,
                              ),
                              onPressed: () => _removeDeadline(ref),
                            ),
                        ],
                      ),
                      child: child,
                    ),
                    child: ConditionalWidget(
                      condition: accessLvl != null,
                      trueWidget: (context) => ConditionalWrapper(
                        condition: !accessLvl!.isRead,
                        wrapper: (context, child) => Draggable<int>(
                          rootOverlay: true,
                          // feedbackOffset: Offset(600, 0),
                          data: widget.moduleId,
                          dragAnchorStrategy: (child, context, offset) => Offset(width / 2, ModuleWidget.height / 2),
                          child: child,
                          feedback: AnimatedPositioned(
                            duration: kFastAnimationDuration,
                            child: SizedBox(
                              width: width,
                              child: ModuleWidget.status(moduleId: widget.moduleId, contextMenu: false),
                            ),
                          ),
                          childWhenDragging: LpShimmer(),
                        ),
                        child: ModuleWidget.status(moduleId: widget.moduleId, contextMenu: false),
                      ),
                      falseWidget: (context) => LpShimmer(),
                    ),
                  ));
        },
      ),
    );
  }
}
