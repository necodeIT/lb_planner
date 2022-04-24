part of lbplanner_routes;

/// Courses selector for settings.
class SettingsCourses extends StatefulWidget {
  /// Courses selector for settings.
  const SettingsCourses({Key? key}) : super(key: key);

  @override
  State<SettingsCourses> createState() => _SettingsCoursesState();
}

class _SettingsCoursesState extends State<SettingsCourses> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      var courses = ref.watch(coursesProvider);

      return LpContainer(
        spacing: true,
        trailing: Expanded(
          child: LpTextField(
            placeholder: t.settings_searchCourses,
          ),
        ),
        width: double.infinity,
        child: ListView(
          children: [
            for (var id in courses.keys) ...[
              SettingsCourseItem(courseId: id),
              NcSpacing.xs(),
            ]
          ],
        ),
      );
    });
  }
}
