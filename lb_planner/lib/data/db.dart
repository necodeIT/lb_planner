import 'package:lb_planner/api/moodle.dart';
import 'package:lb_planner/data.dart';
import 'package:lb_planner/data/course/module.dart';

class DB {
  static List<int> _admins = [];
  static List<int> _mods = [];
  static Map<int, Module> _modules = {};
  static Map<int, Course> _courses = {};

  static void _clear() {
    _admins = List.empty();
    _mods = List.empty();
  }

  static void init() {
    if (User.current == null) {
      _clear();
      return;
    }

    _admins = List.unmodifiable(MoodleAPI.getAdmins());
    _mods = List.unmodifiable(MoodleAPI.getMods());
  }

  static List<int> get admins => _admins;
  static List<int> get mods => _mods;
  static Map<int, Module> get modules => _modules;
  static Map<int, Course> get courses => _courses;
}
