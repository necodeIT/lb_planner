part of lbplanner_api;

/// Provides courses for the current user
final coursesProvider = StateNotifierProvider<CoursesProvider, Map<int, Course>>((ref) => CoursesProvider(ref.watch(userProvider)));

/// Controller for the courses.
final coursesController = coursesProvider.notifier;

/// Provides courses for the current user
class CoursesProvider extends StateNotifier<Map<int, Course>> {
  /// Provides courses for the current user
  CoursesProvider(this.user) : super({});
  // CoursesProvider(this.user) : super({}){
  //   fetchCourses();
  // }

  /// The user to get the courses for
  final User user;

  /// Gets all courses for the current user
  Future<RawApiResponse> fetchCourses() async {
    var response = await CoursesApi.getAllCourses(user.token, user.id);

    if (response.succeeded) state = Map.fromIterable(response.value!, key: (course) => course.id);

    return response;
  }

  /// Updates the [shortname] of the course with the given [id]
  Future<RawApiResponse> updateCourseShortname(int id, String shortname) async {
    assertId(id);

    var oldCourse = state[id];

    var updatedCourse = oldCourse!.copyWith(shortname: shortname);

    var response = await CoursesApi.updateCourse(user.token, user.id, updatedCourse);

    if (response.succeeded) updateValue(id, response.value!);

    return response;
  }

  /// Updates whether the course is [enabled] or not.
  Future<RawApiResponse> enableCourse(int id, bool enabled) async {
    assertId(id);

    var oldCourse = state[id];

    var updatedCourse = oldCourse!.copyWith(enabled: enabled);

    var response = await CoursesApi.updateCourse(user.token, user.id, updatedCourse);

    if (response.succeeded) updateValue(id, response.value!);

    return response;
  }

  /// Updates the [color] of the course with the given [id]

  Future<RawApiResponse> updateCourseColor(int id, String color) async {
    assertId(id);

    var oldCourse = state[id];

    var updatedCourse = oldCourse!.copyWith(colorCode: color);

    var response = await CoursesApi.updateCourse(user.token, user.id, updatedCourse);

    if (response.succeeded) updateValue(id, response.value!);

    return response;
  }
}
