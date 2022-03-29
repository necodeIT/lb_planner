import 'package:flutter_test/flutter_test.dart';
import 'package:lbplanner_api/lbplanner_api.dart';

void main() {
  test("Empty user", () {
    expect(User.empty().isEmpty, true);
  });

  test("User from json", () {
    final user = User.fromJson({
      'id': 1,
      'username': 'test',
      'firstname': 'test',
      'lastname': 'test',
      'avatar': 'test',
      'language': 'en',
      'theme': 'test',
      'accessLevel': 'student',
    });

    expect(user.id, 1);
    expect(user.username, 'test');
    expect(user.firstname, 'test');
    expect(user.lastname, 'test');
    expect(user.avatar, 'test');
    expect(user.language, Languages.en);
    expect(user.theme, 'test');
    expect(user.accessLevel, AccessLevels.student);
  });
}
