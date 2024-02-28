import 'package:lb_planner/features/course_selection/course_selection.dart';
import 'package:lb_planner/shared/shared.dart';

/// Data source for courses.
abstract class CoursesDataSource extends DataSource {
  /// Initializes a new instance of [CoursesDataSource] with logging set up.
  CoursesDataSource() : super("Courses");

  /// Fetches all courses the use is enrolled in.
  Future<List<Course>> fetchCourses();

  /// Fetches a course by its id.
  Future<Course> fetchCourseById(int id);

  /// Updates a course.
  Future<void> updateCourse(Course course);
}
