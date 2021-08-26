import 'package:lb_planner/data/enums/grade.dart';
import 'package:lb_planner/data/enums/module_type.dart';
import 'package:lb_planner/data/enums/status.dart';

class Module {
  Module(this.isEnabled, this.moodleDeadline, this.deadlineEnd, this.deadlineStart, this.id, this.name, this.url, this.grade, this.status, this.type) {
    var filter = name.toLowerCase();

    type = ModuleType.GK;
    if (testKeywords.any((i) => filter.contains(i))) type = ModuleType.Test;
    if (ekKeywords.any((i) => filter.contains(i))) type = ModuleType.EK;

    splitCharachters.forEach((i) => filter = filter.replaceAll(i, splitCharacter));

    var split = name.replaceAll("-", splitCharacter).split(splitCharacter);

    tag = split.length >= 0 ? split.first : name;
  }

  final DateTime moodleDeadline;
  final int id;
  final String name;
  final String url;
  final Grade grade;
  final Status status;

  late final ModuleType type;
  late final String tag;

  late bool isEnabled;
  late DateTime deadlineEnd;
  late DateTime deadlineStart;

  static const List<String> testKeywords = ["[test]", "[schularbeit]", "[exam]", "[sa]"];
  static const List<String> ekKeywords = ["[extend]", "[erweitert]", "[ek]", "[ei]"];
  static const List<String> splitCharachters = ["-"];
  static const String splitCharacter = " ";
}
