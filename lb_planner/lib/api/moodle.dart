import 'package:lb_planner/data.dart';

class MoodleAPI {
  static List<int> getAdmins() {
    return [10, 5, 6];
  }

  static List<int> getMods() {
    List<int> mods = List.empty(growable: true);
    if (User.current == null) return mods;

    for (var i = 0; i < 10; i++) {
      mods.add(i);
    }

    return mods;
  }
}
