part of lbplanner_routes;

/// Modules overview of a course.
class CalendarCourseModulesOverview extends StatelessWidget {
  /// Modules overview of a course.
  const CalendarCourseModulesOverview({Key? key, required this.courseId, required this.months}) : super(key: key);

  /// The id of the course to display.
  final int courseId;

  /// The months to display.
  final List<int> months;

  /// The height of the course label.
  static const courseHeight = 25.0;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      var course = ref.watch(coursesProvider)[courseId]!;
      var modules = ref.watch(modulesProvider).values.where((module) => module.courseId == courseId).toList();

      return Column(
        children: [
          Container(
            color: course.color,
            height: courseHeight,
            width: CalendarModulesOverviewCell.width,
            child: Center(
              child: NcCaptionText(
                course.shortname,
                buttonText: true,
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                for (var month in months)
                  Expanded(
                    child: CalendarModulesOverviewCell(
                      modules: modules.where((module) => module.deadline?.month == month).map((module) => module.id).toList(),
                    ),
                  ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
