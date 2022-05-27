part of lbplanner_routes;

/// Select courses route diplayed when the user has no courses selected.
class LoginSelectCoursesRoute extends LocalizedWidget {
  /// Select courses route diplayed when the user has no courses selected.
  const LoginSelectCoursesRoute({Key? key}) : super(key: key);

  /// Info about this route.
  static final info = RouteInfo(routeName: "/login/select_courses", builder: (_, __) => LoginSelectCoursesRoute(), standalone: true);

  /// The margin of the selectioon form.
  static const double margin = 100.0;

  @override
  Widget build(context, t) {
    return Stack(
      children: [
        Positioned(
          top: NcSpacing.largeSpacing,
          left: NcSpacing.largeSpacing,
          child: NcCaptionText(
            t.login_selectCourses_title,
            fontSize: RouteTitle.titleSize,
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: NcVectorImage(
            code: svg_select_courses,
            // ignore: no-magic-number
            height: MediaQuery.of(context).size.height * .7,
            alignment: Alignment.centerLeft,
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: margin),
            child: LoginSelectCourseCourseSelection(),
          ),
        ),
      ],
    );
  }
}
