part of lbplanner_routes;

/// Course selection of the select courses route.
class LoginSelectCourseCourseSelection extends StatefulWidget {
  /// Course selection of the select courses route.
  const LoginSelectCourseCourseSelection({Key? key}) : super(key: key);

  /// The width of the course selection.
  static const width = 500.0;

  @override
  State<LoginSelectCourseCourseSelection> createState() => _LoginSelectCourseCourseSelectionState();
}

class _LoginSelectCourseCourseSelectionState extends State<LoginSelectCourseCourseSelection> {
  final TextEditingController _searchController = TextEditingController();

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
        width: LoginSelectCourseCourseSelection.width,
        height: MediaQuery.of(context).size.height * .8,
        trailing: Expanded(
          child: LpTextField.filled(
            prefixIcon: Icons.search,
            placeholder: t.settings_searchCourses,
            controller: _searchController,
            fontSize: 18,
          ),
        ),
        child: Column(
          children: [
            Expanded(
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
            ),
            Align(
              alignment: Alignment.centerRight,
              child: LpTextButton(
                text: t.login_selectCourses_continue,
                trailingIcon: Feather.arrow_right_circle,
                onPressed: () => Navigator.of(context).pushNamed(DashboardRoute.routeName),
                fontSize: SettingsFeedback.fontSize,
              ),
            ),
          ],
        ),
      );
    });
  }
}
