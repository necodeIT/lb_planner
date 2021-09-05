import 'package:lb_planner/data.dart';
import 'package:lb_planner/ui.dart';

class User {
  User(this.id, this.token, this.name, this.plan, this.settings, [this.role = UserPermissions.Student]) {
    email = "$name@$emailSubfix";
    isDummy = false;
  }

  User.dummy([UserPermissions permissions = UserPermissions.Admin]) {
    id = 0;
    token = Token(privateToken: "", token: "");
    name = "Catgirl";
    email = "";
    role = permissions;
    plan = Plan({}, {});
    settings = Settings(NcThemes.sakura.name, {});
    isDummy = true;
  }

  static const emailSubfix = "student.tgm.ac.at";
  static User _current = User.dummy();

  static User get current => _current;
  static set current(User user) {
    if (_current.id == user.id) return;
    _current = user;

    if (user.isDummy) return;
    // DB.init();
  }

  List<int> getUpcommingExams() {
    var now = DateTime.now();
    var exams = List<int>.empty(growable: true);

    DB.modules.forEach((key, value) {
      if (value.type == ModuleType.Test && value.deadline.month == now.month && value.deadline.isBefore(now.add(Duration(days: 1)))) exams.add(key);
    });

    return exams;
  }

  late final int id;
  late final Token token;
  late final String name;
  late final String email;
  late final UserPermissions role;
  late final Plan plan;
  late final Settings settings;
  late final bool isDummy;
}
