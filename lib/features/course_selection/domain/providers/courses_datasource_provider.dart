import 'package:lb_planner/features/auth/auth.dart';
import 'package:lb_planner/features/course_selection/course_selection.dart';
import 'package:lb_planner/features/course_selection/data/data.dart';
import 'package:lb_planner/shared/shared.dart';
import 'package:riverpod/riverpod.dart';

/// Provides the current [CoursesDataSource] instance.
final coursesDataSourceProvider = Provider<CoursesDataSource>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  final token = ref.watch(userTokenProvider);

  if (!token.hasValue) {
    return TokenUnavailableCoursesDataSource();
  }

  return StdCoursesDataSource(apiService, token.requireValue);
});
