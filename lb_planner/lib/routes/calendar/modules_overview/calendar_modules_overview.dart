part of lbplanner_routes;

/// Modules overview route.
class CalendarModulesOverviewRoute extends StatelessWidget {
  /// Modules overview route.
  const CalendarModulesOverviewRoute({Key? key}) : super(key: key);

  /// The route name.
  static const routeName = "calendar/modules-overview";

  /// A list of months which are in the winter (the first) semester of school.
  static const winterMonths = [
    DateTime.september,
    DateTime.october,
    DateTime.november,
    DateTime.december,
    DateTime.january,
    DateTime.february,
  ];

  /// A list of months which are in the summer (the second) semester of school.
  static const summerMonths = [DateTime.february, DateTime.march, DateTime.april, DateTime.may, DateTime.june, DateTime.july];

  @override
  Widget build(BuildContext context) {
    return Calendar(
      child: Consumer(builder: (context, ref, _) {
        var courses = ref.watch(coursesProvider);

        return Row(
          children: [
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  // StickyHeader(header: , content: content)
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
