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
    log("Fetching course with id $id...");

    final response = await apiService.callFunction(
      function: "local_lbplanner_courses_get_course",
      token: token.lbPlannerApiToken,
      body: {
        "courseid": id,
      },
    );

    if (response.failed) {
      log("Failed to fetch course with id $id.", response.body);

      throw Exception("Failed to fetch course with id $id: ${response.body}");
    }

    return Course.fromJson(response.expectSingle());
  }

  @override
  Future<List<Course>> fetchCourses() async {
    log("Fetching all courses...");

    final response = await apiService.callFunction(
      function: "local_lbplanner_courses_get_courses",
      token: token.lbPlannerApiToken,
      body: {},
    );

    if (response.failed) {
      log("Failed to fetch courses.", response.body);

      throw Exception("Failed to fetch courses: ${response.body}");
    }

    final course = response.expectMultiple().map(Course.fromJson).toList();

    log("Fetched ${course.length} courses.");

    return course;
  }

  @override
  Future<void> updateCourse(Course course) async {
    log("Updating course with id ${course.id}...");

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
      log("Failed to update course with id ${course.id}.", response.body);

      throw Exception("Failed to update course: ${response.body}");
    }

    log("Updated course with id ${course.id}.");

    return;
  }
}
