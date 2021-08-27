import 'package:lb_planner/data.dart';

class User {
  User(this.id, this.token, this.name, this.plan, this.email, this.settings, [this.role = UserPermissions.Student]) {
    email = "$name@$emailSubfix";
  }

  static const emailSubfix = "student.tgm.ac.at";
  static User? _current;

  static User? get current => _current;
  static set current(User? user) {
    if (_current?.id == user?.id) return;

    _current = user;

    DB.init();
  }

  final int id;
  final Token token;
  final String name;
  late final String email;
  final UserPermissions role;
  final Plan plan;
  final Settings settings;
}
