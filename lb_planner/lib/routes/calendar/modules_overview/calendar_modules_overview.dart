part of lbplanner_routes;

/// Modules overview route.
class CalendarModulesOverviewRoute extends StatefulWidget {
  /// Modules overview route.
  const CalendarModulesOverviewRoute({Key? key}) : super(key: key);

  /// The route name.
  static const routeName = "calendar/modules-overview";

  /// A list of months which are in the winter (the first) semester of school.
  static const winterMonths = [DateTime.september, DateTime.october, DateTime.november, DateTime.december, DateTime.january, DateTime.february];

  /// A list of months which are in the summer (the second) semester of school.
  static const summerMonths = [DateTime.february, DateTime.march, DateTime.april, DateTime.may, DateTime.june, DateTime.july];

  @override
  State<CalendarModulesOverviewRoute> createState() => _CalendarModulesOverviewRouteState();
}

class _CalendarModulesOverviewRouteState extends State<CalendarModulesOverviewRoute> with WindowListener {
  final winterKey = GlobalKey();

  final summerKey = GlobalKey();

  final scrollController = ScrollController();

  @override
  void initState() {
    windowManager.addListener(this);

    super.initState();
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  @override
  void onWindowResize() {
    scrollToSummer();

    super.onWindowResized();
  }

  void scrollToSummer() {
    if (!CalendarModulesOverviewRoute.summerMonths.contains(DateTime.now().month)) return;

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Scrollable.ensureVisible(
        summerKey.currentContext!,
        duration: kSlowAnimationDuration,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    scrollToSummer();

    return Calendar(
      child: Consumer(
        builder: (context, ref, _) {
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
                    header: CalendarModulesOverviewMonthHeader(months: CalendarModulesOverviewRoute.winterMonths),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate.fixed(
                        [
                          for (var course in enabledCourses) CalendarCourseModulesOverview(courseId: course.id, months: CalendarModulesOverviewRoute.winterMonths),
                        ],
                      ),
                    ),
                  ),
                  SliverStickyHeader(
                    key: summerKey,
                    header: CalendarModulesOverviewMonthHeader(months: CalendarModulesOverviewRoute.summerMonths),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate.fixed(
                        [
                          for (var course in enabledCourses) CalendarCourseModulesOverview(courseId: course.id, months: CalendarModulesOverviewRoute.summerMonths),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
