import 'package:flutter_test/flutter_test.dart';
import 'package:lbplanner_api/lbplanner_api.dart';

void main() {
  test("Create user", () {
    User user = User(
      username: "usernamsdase",
      firstname: "firstname",
      lastname: "lastname",
      avatar: Uri.parse("https://i.kym-cdn.com/entries/icons/mobile/000/017/595/catgirlheader.jpg"),
      language: Languages.en,
      theme: "Test",
      accessLevel: AccessLevels.admin,
    );
  });
}
