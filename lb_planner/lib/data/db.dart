import 'package:lb_planner/api/moodle.dart';
import 'package:lb_planner/data.dart';
import 'package:lb_planner/data/course/module.dart';

class DB {
  static Map<int, Module> _modules = {};
  static Map<int, Course> _courses = {};

  static void _clear() {
    _courses = Map();
    _modules = Map();
  }

  static void init() {
    if (User.current.isDummy) {
      _clear();
      return;
    }
  }

  static Map<int, Module> get modules => _modules;
  static Map<int, Course> get courses => _courses;
}
