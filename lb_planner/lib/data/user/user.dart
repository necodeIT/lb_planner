import '../../data.dart';

class User {
  static const emailSubfix = "student.tgm.ac.at";
  static User? _current;

  static User? get current => _current;
  static set current(User? user) {
    if (_current?.id == user?.id) return;

    _current = user;

    DB.init();
  }

  User({required this.id, required this.token, required this.name, required this.role}) {
    email = "$name@$emailSubfix";
  }

  final int id;
  final Token token;
  final String name;
  late final String email;
  final UserRole role;
}
