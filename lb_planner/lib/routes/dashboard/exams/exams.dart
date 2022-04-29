part of lbplanner_routes;

/// Exams section of the dashboard route.
class DashboardExams extends LocalizedWidget {
  /// Exams section of the dashboard route.
  const DashboardExams({Key? key}) : super(key: key);

  @override
  Widget create(context, t) {
    return Consumer(builder: (context, ref, _) {
      var modules = ref.watch(modulesProvider);

      var exams = <Module>[];

      for (var module in modules.values) {
        if (module.type != ModuleTypes.test) continue;

        if (module.deadline == null) continue;

        var diff = module.deadline!.difference(DateTime.now());
        print(diff.inDays);
        if (diff.inDays.isNegative || diff.inDays > 14) continue;

        exams.add(module);
      }

      return LpContainer(
        spacing: true,
        title: t.dashboard_exams_title,
        width: double.infinity,
        child: ConditionalWidget(
          condition: exams.isNotEmpty,
          trueWidget: (context) => ListView(
            children: [
              for (var exam in exams) ...[
                DashboardExamsItem(
                  examId: exam.id,
                ),
                NcSpacing.small(),
              ],
            ],
          ),
          falseWidget: (context) => Center(
            child: NcBodyText(t.dashboard_exams_noExams),
          ),
        ),
      );
    });
  }
}
