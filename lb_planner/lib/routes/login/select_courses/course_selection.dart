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
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      var courses = ref.watch(coursesProvider);
      return LpContainer(
        width: LoginSelectCourseCourseSelection.width,
        height: MediaQuery.of(context).size.height * .8,
        trailing: Expanded(
          child: LpTextField.filled(),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  for (var id in courses.keys) ...[
                    SettingsCourseItem(courseId: id),
                    NcSpacing.xs(),
                  ]
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: LpTextButton(
                text: t.settings_feedback_submit,
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
