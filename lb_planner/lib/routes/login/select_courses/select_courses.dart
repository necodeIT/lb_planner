part of lbplanner_routes;

/// Select courses route diplayed when the user has no courses selected.
class LoginSelectCoursesRoute extends StatelessWidget {
  /// Select courses route diplayed when the user has no courses selected.
  const LoginSelectCoursesRoute({Key? key}) : super(key: key);

  /// The name of this route.
  static const routeName = '/login/select-courses';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: NcVectorImage(
            code: svg_select_courses,
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.centerLeft,
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: NcSpacing.xlSpacing),
            child: LoginSelectCourseCourseSelection(),
          ),
        ),
      ],
    );
  }
}
