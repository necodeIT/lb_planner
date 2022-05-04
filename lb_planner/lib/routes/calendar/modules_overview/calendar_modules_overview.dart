part of lbplanner_routes;

/// Modules overview route.
class CalendarModulesOverviewRoute extends LocalizedWidget {
  /// Modules overview route.
  CalendarModulesOverviewRoute({Key? key}) : super(key: key);

  /// The route name.
  static const routeName = "calendar/modules-overview";

  /// A list of months which are in the winter (the first) semester of school.
  static const winterMonths = [DateTime.september, DateTime.october, DateTime.november, DateTime.december, DateTime.january, DateTime.february];

  /// A list of months which are in the summer (the second) semester of school.
  static const summerMonths = [DateTime.february, DateTime.march, DateTime.april, DateTime.may, DateTime.june, DateTime.july];

  /// The key of the list that displays the winter months.
  final winterKey = GlobalKey();

  /// The key of the list that displays the summer months.
  final summerKey = GlobalKey();

  final scrollController = ScrollController();

  @override
  Widget create(BuildContext context, t) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (summerMonths.contains(DateTime.now().month)) Scrollable.ensureVisible(summerKey.currentContext!);
    });

    return Calendar(
      child: Consumer(builder: (context, ref, _) {
        var courses = ref.watch(coursesProvider);

        var enabledCourses = courses.values.where((course) => course.enabled);

        return ConditionalWidget(
            condition: enabledCourses.isEmpty,
            trueWidget: (context) => Center(
                  child: NcCaptionText(
                    t.calendar_modulesOverview_noCourses,
                    color: textColor,
                  ),
                ),
            falseWidget: (context) => Scrollbar(
                  isAlwaysShown: true,
                  controller: scrollController,
                  scrollbarOrientation: ScrollbarOrientation.bottom,
                  child: CustomScrollView(
                    controller: scrollController,
                    scrollDirection: Axis.horizontal,
                    slivers: [
                      SliverStickyHeader(
                        key: winterKey,
                        header: CalendarModulesOverviewMonthHeader(months: winterMonths),
                        sliver: SliverList(
                          delegate: SliverChildListDelegate.fixed(
                            [
                              for (var course in enabledCourses) CalendarCourseModulesOverview(courseId: course.id, months: winterMonths),
                            ],
                          ),
                        ),
                      ),
                      SliverStickyHeader(
                        key: summerKey,
                        header: CalendarModulesOverviewMonthHeader(months: summerMonths),
                        sliver: SliverList(
                          delegate: SliverChildListDelegate.fixed(
                            [
                              for (var course in enabledCourses) CalendarCourseModulesOverview(courseId: course.id, months: summerMonths),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ));
      }),
    );
  }
}
