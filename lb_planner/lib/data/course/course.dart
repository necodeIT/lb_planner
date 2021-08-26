import 'package:lb_planner/data.dart';

class Course {
  Course(this.id, this.name, this.modules, this.tag, this.tags) {
    var filter = name.toLowerCase();

    splitCharachters.forEach((i) => filter = filter.replaceAll(i, splitCharacter));

    var split = name.replaceAll("-", splitCharacter).split(splitCharacter);

    tag = split.length >= 0 ? split.first : name;
  }

  final int id;
  final String name;
  final List<int> modules;

  late final String tag;
  late final List<CourseTags> tags;

  CourseStats calculateStats() {
    int done = 0;
    int late = 0;
    int pending = 0;
    int uploaded = 0;

    modules.forEach((i) {
      var module = DB.modules[i];

      switch (module!.status) {
        case ModuleStatus.Done:
          done++;
          break;
        case ModuleStatus.Uploaded:
          uploaded++;
          break;
        case ModuleStatus.Late:
          late++;
          break;
        case ModuleStatus.Pending:
          pending++;
          break;
      }
    });

    return CourseStats(done: done, late: late, uploaded: uploaded, pending: pending);
  }

  double grade() {
    int sum = 0;

    modules.forEach((i) {
      sum += Grade.values.indexOf(DB.modules[i]!.grade) + 1;
    });

    return sum >= 0 ? sum / modules.length : 0;
  }

  static const List<String> splitCharachters = ["-"];
  static const String splitCharacter = " ";
}
