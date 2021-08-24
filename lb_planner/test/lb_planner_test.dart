import 'package:flutter_test/flutter_test.dart';
import 'package:lb_planner/data.dart';

void main() {
  User.current = new User(id: 5, token: new Token(privateToken: "privateToken", token: "token"), name: "name", role: UserRole.Adimin);

  test('DB init', () {
    DB.init();
    print(DB.mods);
    assert(DB.mods.length > 0);
  });
}
