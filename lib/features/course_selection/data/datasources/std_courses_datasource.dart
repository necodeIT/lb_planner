import 'package:lb_planner/features/auth/auth.dart';
import 'package:lb_planner/features/course_selection/course_selection.dart';
import 'package:lb_planner/shared/shared.dart';

/// Standard implementation of [CoursesDataSource].
class StdCoursesDataSource extends CoursesDataSource {
  /// The API service to use for requests.
  final ApiService apiService;

  /// The user token to use for requests.
  final UserToken token;

  /// Standard implementation of [CoursesDataSource].
  StdCoursesDataSource(this.apiService, this.token);

  @override
  Future<Course> fetchCourseById(int id) async {
    final response = await apiService.callFunction(
      function: "local_lbplanner_courses_get_course",
      token: token.lbPlannerApiToken,
      body: {
        "courseid": id,
      },
    );

    if (response.failed) {
      throw Exception("Failed to fetch course with id $id: ${response.body}");
    }

    return Course.fromJson(response.expectSingle());
  }

  @override
  Future<List<Course>> fetchCourses() async {
    final response = await apiService.callFunction(
      function: "local_lbplanner_courses_get_courses",
      token: token.lbPlannerApiToken,
      body: {},
    );

    if (response.failed) {
      throw Exception("Failed to fetch courses: ${response.body}");
    }

    return response.expectMultiple().map(Course.fromJson).toList();
  }

  @override
  Future<void> updateCourse(Course course) async {
    final response = await apiService.callFunction(
      function: "local_lbplanner_courses_update_course",
      token: token.lbPlannerApiToken,
      body: {
        "courseid": course.id,
        "shortname": course.shortName,
        "color": course.colorCode,
        "enabled": course.isEnabled,
      },
    );

    if (response.failed) {
      throw Exception("Failed to update course: ${response.body}");
    }

    return;
  }
}
