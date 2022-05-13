part of lbplanner_routes;

/// Wraps the [ModuleWidget] in a [LongPressDraggable].
class DraggableModule extends StatelessWidget {
  /// Wraps the [ModuleWidget] in a [LongPressDraggable].
  const DraggableModule({Key? key, required this.moduleId}) : super(key: key);

  /// The id of the module to display.
  final int moduleId;

  @override
  Widget build(BuildContext context) {
    return Draggable<int>(
      data: moduleId,
      child: ModuleWidget.status(moduleId: moduleId),
      feedback: SizedBox(
        width: 200,
        child: ModuleWidget.status(moduleId: moduleId),
      ),
      childWhenDragging: LpShimmer(),
    );
  }
}
