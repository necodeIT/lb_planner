part of lbplanner_routes;

/// Item for the exams section of the dashboard route.
class DashboardExamsItem extends StatelessWidget {
  /// Item for the exams section of the dashboard route.
  const DashboardExamsItem({Key? key, required this.examId}) : super(key: key);

  /// The exam id.
  final int examId;

  /// Formatter for the date.
  static final formatter = DateFormat('dd.MM');

  /// The font size of the course tag.
  static const double tagSize = 12;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      var exam = ref.watch(modulesProvider)[examId]!;

      var courses = ref.watch(coursesProvider);

      return ConditionalWidget(
        condition: courses.containsKey(exam.courseId),
        trueWidget: (context) {
          var course = courses[exam.courseId]!;

          return Container(
            padding: const EdgeInsets.symmetric(
              vertical: NcSpacing.xsSpacing,
              horizontal: NcSpacing.smallSpacing,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kRadius),
              color: secondaryColor,
            ),
            child: Row(
              children: [
                LpTag(
                  text: course.shortname,
                  color: course.color,
                  fontSize: tagSize,
                ),
                NcSpacing.small(),
                Expanded(
                  child: NcBodyText(
                    exam.name,
                    textAlign: TextAlign.center,
                    // fontSize: 14,
                  ),
                ),
                NcBodyText(formatter.format(exam.deadline!))
              ],
            ),
          );
        },
        falseWidget: (context) => LpLoadingIndicator(),
      );
    });
  }
}
