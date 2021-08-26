import 'package:flutter_test/flutter_test.dart';
import 'package:lb_planner/data.dart';
import 'package:lb_planner/api.dart';

void main() async {
  // User.current = new User(id: 5, token: new Token(privateToken: "privateToken", token: "token"), name: "name", role: UserRole.Adimin);

  var response = await MoodleAPI.login("webservice_proj_lbplaner", "ZumTag32%Kum");

  if (response.isError) return print(response.errorMessage);

  Token token = response.value;

  var response2 = await MoodleAPI.getUserID(token);

  if (response2.isError) return print(response2.errorMessage);

  int id = response2.value;

  print(id);
}
