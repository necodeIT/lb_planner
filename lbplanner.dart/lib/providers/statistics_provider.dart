part of lbplanner_api;

/// Provides statistics for the current user
final statisticsProvider = StateNotifierProvider<StatisticsProvider, Statistics>((ref) => StatisticsProvider(ref.watch(modulesProvider).values.toList()));

/// Controller for the statistics.
final statisticsController = statisticsProvider.notifier;

/// Provides statistics for the current user
class StatisticsProvider extends StateNotifier<Statistics> {
  /// The modules to analyze.
  final List<Module> modules;

  /// Provides statistics for the current user
  StatisticsProvider(this.modules) : super(Statistics()) {
    analyze();
  }

  /// Analyzes the modules and updates the statistics.
  void analyze() {
    var stats = Statistics(totalModules: modules.length);
    var courseStats = stats.courseStats;

    for (var module in modules) {
      var course = courseStats[module.courseId] ?? Statistics(totalModules: 0);

      course = course.copyWith(
        totalModules: course.totalModules + 1,
      );

      switch (module.status) {
        case ModuleStatus.done:
          courseStats[module.courseId] = course.copyWith(completedModules: course.completedModules + 1);

          stats = stats.copyWith(
            completedModules: stats.completedModules + 1,
          );

          break;

        case ModuleStatus.uploaded:
          courseStats[module.courseId] = course.copyWith(uploadedModules: course.uploadedModules + 1);

          stats = stats.copyWith(
            uploadedModules: stats.uploadedModules + 1,
          );

          break;

        case ModuleStatus.late:
          courseStats[module.courseId] = course.copyWith(lateModules: course.lateModules + 1);

          stats = stats.copyWith(
            lateModules: stats.lateModules + 1,
          );

          break;

        case ModuleStatus.pending:
          courseStats[module.courseId] = course.copyWith(pendingModules: course.pendingModules + 1);

          stats = stats.copyWith(
            pendingModules: stats.pendingModules + 1,
          );

          break;
      }
    }

    state = stats.copyWith(courseStats: courseStats);
  }
}
