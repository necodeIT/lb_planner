import '../../data.dart';

class User {
  User({required this.id, required this.token, required this.name, this.role = UserPermissions.None}) {
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
}
