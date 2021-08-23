import 'package:lb_planner/api/moodle.dart';
import 'package:lb_planner/data.dart';

class DB {
  static List<int> _admins = List.empty();
  static List<int> _mods = List.empty();
  static List<int> _modules = List.empty();
  static List<int> _courses = List.empty();

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
  static List<int> get modules => _modules;
  static List<int> get courses => _courses;
}
