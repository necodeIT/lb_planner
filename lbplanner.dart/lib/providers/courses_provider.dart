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
  // Future<RawApiResponse> fetchCourses() async {
  //   var response = await CoursesApi.getAllCourses(user.token, user.id);

  //   if (response.succeeded) state = Map.fromIterable(response.value!, key: (course) => course.id);

  //   return response;
  // }
}
