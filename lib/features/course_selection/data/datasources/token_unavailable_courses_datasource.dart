import 'package:lb_planner/features/course_selection/course_selection.dart';
import 'package:lb_planner/shared/utils/warn_mixin.dart';

/// Placeholder implementatnion of [CoursesDataSource] if the user is not logged in.
class TokenUnavailableCoursesDataSource extends CoursesDataSource
    with StubWarnMixin {
  /// Placeholder implementatnion of [CoursesDataSource] if the user is not logged in.
  TokenUnavailableCoursesDataSource();

  @override
  Future<Course> fetchCourseById(int id) async {
    warn("fetchCourseById");

    return Course(
      id: id,
      shortName: "-----",
      colorCode: "#000000",
      isEnabled: true,
    );
  }

  @override
  Future<List<Course>> fetchCourses() async {
    warn("fetchCourses");

    return [];
  }

  @override
  Future<void> updateCourse(Course course) async => warn("updateCourse");
}
