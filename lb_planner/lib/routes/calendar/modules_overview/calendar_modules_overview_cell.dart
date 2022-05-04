part of lbplanner_routes;

/// Cell for the modules overview.
class CalendarModulesOverviewCell extends StatelessWidget {
  /// Cell for the modules overview.
  const CalendarModulesOverviewCell({Key? key, required this.modules}) : super(key: key);

  /// The modules to display.
  final List<int> modules;

  /// The width of the cell.
  static const width = 40.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: width,
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
            color: tertiaryColor,
            width: 1.0,
          ),
        ),
      ),
      child: ListView(
        children: [
          for (var module in modules)
            ModuleWidget.checkmark(
              moduleId: module,
              showTag: false,
            ),
        ],
      ),
    );
  }
}
