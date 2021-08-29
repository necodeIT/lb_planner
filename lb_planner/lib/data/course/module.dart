import 'package:lb_planner/data/enums/grade.dart';
import 'package:lb_planner/data/enums/module_type.dart';
import 'package:lb_planner/data/enums/status.dart';

class Module {
  Module(this.isEnabled, this.id, this.name, this.url, this.grade, this.status, this.type, this.deadline, this.course) {
    var filter = name.toLowerCase();

    type = ModuleType.GK;
    if (testKeywords.any((i) => filter.contains(i))) type = ModuleType.Test;
    if (ekKeywords.any((i) => filter.contains(i))) type = ModuleType.EK;
  }

  final DateTime deadline;
  final int id;
  final int course;
  final String name;
  final String url;
  final Grade grade;
  final ModuleStatus status;

  late final ModuleType type;

  late bool isEnabled;

  static const List<String> testKeywords = ["[test]", "[schularbeit]", "[exam]", "[sa]"];
  static const List<String> ekKeywords = ["[extend]", "[erweitert]", "[ek]", "[ei]"];
}
