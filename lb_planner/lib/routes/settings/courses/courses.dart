part of lbplanner_routes;

/// Courses selector for settings.
class SettingsCourses extends StatefulWidget {
  /// Courses selector for settings.
  const SettingsCourses({Key? key}) : super(key: key);

  @override
  State<SettingsCourses> createState() => _SettingsCoursesState();
}

class _SettingsCoursesState extends State<SettingsCourses> {
  TextEditingController _searchController = TextEditingController();

  @override
  initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      var courses = ref.watch(coursesProvider);

      return LpContainer(
        trailing: Expanded(
          child: LpTextField.filled(
            prefixIcon: Icons.search,
            placeholder: t.settings_searchCourses,
            controller: _searchController,
            fontSize: 18,
          ),
        ),
        width: double.infinity,
        child: ListView(
          children: [
            for (var course in courses.values)
              if (course.name.containsCaseInsensitive(_searchController.text)) ...[
                SettingsCourseItem(
                  courseId: course.id,
                  key: ValueKey(course.id),
                ),
                NcSpacing.xs(),
              ]
          ],
        ),
      );
    });
  }
}
