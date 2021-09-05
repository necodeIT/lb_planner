import 'package:lb_planner/data.dart';

class UserInfo {
  UserInfo(this.id, this.name, this.token, this.permissions, this.isNew) {
    restricted = false;
  }

  UserInfo.restricted(this.id, this.name) {
    restricted = true;
  }

  final int id;
  final String name;

  late final bool restricted;
  late final Token token;
  late final UserPermissions permissions;
  late final bool isNew;
}
