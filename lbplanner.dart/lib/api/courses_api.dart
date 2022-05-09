part of lbplanner_api;

/// Gets all courses for the current user
class CoursesApi {
  /// Gets all courses for the current user
  static Future<ApiResponse<List<Course>>> getAllCourses(String token, int userId) async {
    var response = await Api.makeRequest(
      functionName: "local_lbplanner_courses_get_all_courses",
      token: token,
      params: {
        "userid": userId,
      },
    );

    List<Course>? courses;

    if (response.succeeded) {
      courses = [];

      for (var course in response.body[kApiListContent]) {
        var courseMap = Map.of(course).cast<String, dynamic>(); 
        courses.add(Course.fromJson(courseMap.mapCourse()));
      }
    }

    return ApiResponse(response.response, courses);
  }

  /// Gets the given course of the given [courseId] for the given [userId].
  static Future<ApiResponse<Course>> getCourse(String token, int userId, int courseId) async {
    var response = await Api.makeRequest(
      functionName: "local_lbplanner_courses_get_course",
      token: token,
      params: {
        "userid": userId,
        "courseid": courseId,
      },
    );

    Course? course;

    if (response.succeeded) course = Course.fromJson(response.body.mapCourse());

    return ApiResponse(response.response, course);
  }

  /// Updates the given [course] for the given [userId].
  static Future<ApiResponse<Course>> updateCourse(String token, int userId, Course data) async {
    var response = await Api.makeRequest(
      functionName: "local_lbplanner_courses_update_course",
      token: token,
      params: {
        "userid": userId,
        "courseid": data.id,
      },
      body: {
        "color": data.colorCode,
        "shortname": data.shortname,
        "enabled": data.enabled.intValue,
      },
    );

    Course? course;

    if (response.succeeded) course = Course.fromJson(response.body.mapCourse());

    return ApiResponse(response.response, course);
  }
}
