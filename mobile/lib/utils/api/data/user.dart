import 'package:lb_planner/utils/api/data/token.dart';

class User {
  User({required this.id, required this.token, required this.name});

  final int id;
  final String name;
  final Token token;
}
