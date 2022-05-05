part of lbplanner_routes;

/// Cell for the modules overview.
class CalendarModulesOverviewCell extends StatelessWidget {
  /// Cell for the modules overview.
  const CalendarModulesOverviewCell({Key? key, required this.modules}) : super(key: key);

  /// The modules to display.
  final List<int> modules;

  /// The width of the cell.
  static const width = 200.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(NcSpacing.xsSpacing),
      width: width,
      height: width,
      decoration: BoxDecoration(
        border: Border.all(
          color: tertiaryColor,
          width: 0.5,
        ),
      ),
      child: Column(
        children: [
          if (modules.isNotEmpty)
            Align(
              alignment: Alignment.topRight,
              child: NcBodyText(modules.length.toString()),
            ),
          Expanded(
            child: ListView(
              controller: ScrollController(),
              children: [
                for (var module in modules) ...[
                  ModuleWidget.checkmark(
                    moduleId: module,
                    showTag: false,
                  ),
                  NcSpacing.xs(),
                ]
              ],
            ),
          ),
        ],
      ),
    );
  }
}
