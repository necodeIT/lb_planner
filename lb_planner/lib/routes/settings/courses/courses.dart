part of lbplanner_routes;

/// Courses selector for settings.
class SettingsCourses extends StatefulWidget {
  /// Courses selector for settings.
  const SettingsCourses({Key? key}) : super(key: key);

  @override
  State<SettingsCourses> createState() => _SettingsCoursesState();
}

class _SettingsCoursesState extends State<SettingsCourses> {
  final TextEditingController _searchController = TextEditingController();

  CoursesProvider? _courses;

  @override
  initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {});
    });
  }

  @override
  dispose() {
    _courses?.stopRefresh();
    _searchController.dispose();

    super.dispose();
  }

  void _startRefresh(WidgetRef ref) {
    _courses = ref.watch(coursesController);
    _courses?.startRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      _startRefresh(ref);
      var courses = ref.watch(coursesProvider);

      return LpContainer(
        trailing: Expanded(
          child: LpTextField.filled(
            prefixIcon: Ionicons.search,
            placeholder: t.settings_searchCourses,
            controller: _searchController,
            fontSize: LoginSelectCourseCourseSelection.searchFontSize,
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
